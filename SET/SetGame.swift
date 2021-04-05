//
//  SetGame.swift
//  SET
//
//  Created by Miguel Angel Hernandez Torrez on 3/4/21.
//

import Foundation

struct SetGame{
	private var deck = Array<Card>()
	private(set) var cards = Array<Card>()
	
	private var selectedCards: Array<Card>{
		cards.filter{card in card.isSelected}
	}
	
	mutating func newGame(){
		self.deck = self.createDeck().shuffled()
		self.cards = Array<Card>()
		self.drawCards(12)
	}
	
	private func createDeck()->Array<Card>{
		var id: Int = 1
		var deck: Array<Card> = Array<Card>()
		for shape in Card.Shape.allCases{
			for shade in Card.Shading.allCases{
				for color in Card.Color.allCases{
					for numberOfShapes in Card.NumberOfShape.allCases{
						deck.append(Card(id: id, shape: shape, shading: shade, color: color, numberOfShapes: numberOfShapes))
						id += 1
					}
				}
			}
		}
		return deck
	}
	
	func setsFound()->Int{
		(81 - deck.count - cards.count)/3
	}
	
	mutating func selectCard(card selectedCard: Card){
		
		if let selectedIndex = cards.firstIndex(matching: selectedCard){
			cards[selectedIndex].isSelected = !cards[selectedIndex].isSelected
		}
		
			let match = calculateMatch()
			if  match == Card.matchingStatus.Match {
				print("MATCH")
				isMatch()
			} else if match == Card.matchingStatus.NoMatch {
				noMatch()
				print("NO MATCH")
			}
		
	}
	
	private mutating func drawCards(_ count: Int) {
		for _ in 0..<count {
			if let card = deck.popLast() {
				cards.append(card)
			} else {
				break
			}
		}
	}
	
	mutating func dealCards(){
		drawCards(3)
	}
	
	private func calculateMatch() -> Card.matchingStatus{
		if selectedCards.count < 3{
			return .Undefined
		}
		// same numer of shapes
		let numberOfShapes = Set(self.selectedCards.map{card in card.numberOfShapes})
		if numberOfShapes.count == 2{
			return .NoMatch
		}
		
		// same shape
		let shapes =  Set(self.selectedCards.map{card in card.shape})
		if shapes.count == 2{
			return .NoMatch
		}
		
		// same color
		let colors = Set(self.selectedCards.map{card in card.color})
		if colors.count == 2{
			return .NoMatch
		}
		
		// same shading
		let shades =  Set(self.selectedCards.map{card in card.shading})
		if shades.count == 2{
			return .NoMatch
		}
		
		return .Match
	}
	
	mutating private func isMatch(){
		// remove matching cards from cards showing in screen
		for card in selectedCards{
			let indexOfCard = cards.firstIndex(matching: card)!
			self.cards.remove(at: indexOfCard)
		}
	}
	
	mutating private func noMatch(){
		// deselect all selected cards
		for card in selectedCards{
			let indexOfCard = cards.firstIndex(matching: card)!
			self.cards[indexOfCard].isSelected = !self.cards[indexOfCard].isSelected
		}
	}
	
	struct Card: Identifiable {
		var id: Int
		var isSelected: Bool = false
		var isMatched: Bool = false
		
		let shape: Shape
		let shading: Shading
		let color: Color
		let numberOfShapes: NumberOfShape
		
		enum Shape: CaseIterable{
			case Squiggle, Diamond, Oval
		}
		
		enum Shading: CaseIterable{
			case Solid, Striped, Open
		}
		
		enum Color: CaseIterable{
			case Green, Red, Purple
		}
		
		enum NumberOfShape: Int, CaseIterable {
			case One = 1, Two = 2, Three = 3
		}
		
		enum matchingStatus: CaseIterable {
			case Match, NoMatch, Undefined
		}
	}
}

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
	private var numberOfSelectedCards: Int = 0
	
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
			numberOfSelectedCards += 1
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
	}
}

//
//  SetGameViewModel.swift
//  SET
//
//  Created by Miguel Angel Hernandez Torrez on 3/4/21.
//

import SwiftUI

class SetGameViewModel: ObservableObject{
	@Published private var game: SetGame = SetGame()
	
	var cards: Array<SetGame.Card>{
		game.cards
	}
	
	var setsFound: Int{
		game.setsFound()
	}
	
	func selectCard(card: SetGame.Card){
		game.selectCard(card: card)
	}
	
	func dealThreeCards(){
		game.dealCards()
	}
	
	func newGame(){
		game.newGame()
	}
	
}

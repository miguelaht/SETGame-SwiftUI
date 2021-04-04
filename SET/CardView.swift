//
//  CardView.swift
//  SET
//
//  Created by Miguel Angel Hernandez Torrez on 4/4/21.
//

import SwiftUI

struct CardView: View {
	var card: SetGame.Card
	
	var body: some View{
		RoundedRectangle(cornerRadius: cornerRadius).fill(cardColor)
		RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth).padding(5)
		VStack(spacing: 1){
			ForEach(0..<card.numberOfShapes.rawValue){_ in
				self.drawShapesInCard().aspectRatio(shapeAspectRatio, contentMode: .fit)
			}
		}
		.padding(shapeViewPadding)
		.foregroundColor(shapeColor)
	}
	
	private func drawShapesInCard()-> some View{
		ZStack{
			switch card.shape {
				case .Diamond:
					Diamond().stroke(lineWidth: shapeEdgeWidth)
				case .Squiggle:
					// FIXME: Write Squiggle shape struct
					Rectangle().stroke(lineWidth: shapeEdgeWidth)
				case .Oval:
					Capsule().stroke(lineWidth: shapeEdgeWidth)
					
			}
		}.padding(shapePadding)
	}
	
	// MARK: - Drawing constants
	private let cornerRadius: CGFloat = 10
	private let edgeLineWidth: CGFloat = 1
	private let shapeEdgeWidth: CGFloat = 2
	private let cardColor: Color = Color.white
	private let shapePadding: CGFloat = 2
	private let shapeAspectRatio: CGFloat = 2
	private let shapeViewPadding: CGFloat = 10
	
	private var shapeColor: Color{
		switch card.color{
			case .Green:
				return Color.green
			case .Red:
				return Color.red
			case .Purple:
				return Color.purple
		}
	}
}

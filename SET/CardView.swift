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
		RoundedRectangle(cornerRadius: cornerRadius).fill(cardColor).padding(cardPadding)
		RoundedRectangle(cornerRadius: cornerRadius).stroke(cardStrokeColor, lineWidth: edgeLineWidth).padding(cardPadding)
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
					Diamond().shading(card.shading)
					Diamond().stroke(lineWidth: shapeEdgeWidth)
				case .Squiggle:
					// FIXME: Write Squiggle shape struct
					Rectangle().shading(card.shading)
					Rectangle().stroke(lineWidth: shapeEdgeWidth)
				case .Oval:
					Capsule().shading(card.shading)
					Capsule().stroke(lineWidth: shapeEdgeWidth)
					
			}
		}.padding(shapePadding)
	}
	
	// MARK: - Drawing constants
	private let cornerRadius: CGFloat = 10
	private let edgeLineWidth: CGFloat = 1.5
	private let shapeEdgeWidth: CGFloat = 2
	private let shapePadding: CGFloat = 2
	private let shapeAspectRatio: CGFloat = 2
	private let shapeViewPadding: CGFloat = 10
	
	
	private var shapeColor: Color{
		switch card.color{
			case .Green:
				return Color.green
			case .Red:
				return Color.red.opacity(0.8)
			case .Purple:
				return Color.purple.opacity(0.8)
		}
	}
	
	
	var cardPadding: CGFloat = 5
	var cardColor: Color {
		return card.isSelected ? Color.blue.opacity(0.1) : Color.white
	}
	var cardStrokeColor: Color{
		return card.isSelected ? Color.blue : Color.black
	}
	
	
	
}

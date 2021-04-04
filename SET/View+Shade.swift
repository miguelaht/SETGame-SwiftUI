//
//  View+Shade.swift
//  SET
//
//  Created by Miguel Angel Hernandez Torrez on 4/4/21.
//

import SwiftUI

struct Shading: ViewModifier {
	let shading: SetGame.Card.Shading
	
	func body(content: Content) -> some View {
		GeometryReader { geometry in
			switch shading {
				case .Solid:
					content.opacity(1)
				case .Striped:
					let lineWidth = geometry.size.width / CGFloat(numberOfLine - 1) * stripeFillRatio
					Stripes()
						.stroke(lineWidth: lineWidth)
						.mask(content)
				case .Open:
					content.opacity(0)
			}
		}
	}
	
	// MARK: - Drawing Variables
	private let numberOfLine = 15
	private let stripeFillRatio: CGFloat = 0.4
	
}

extension View {
	func shading(_ shading: SetGame.Card.Shading) -> some View {
		self.modifier(Shading(shading: shading))
	}
}

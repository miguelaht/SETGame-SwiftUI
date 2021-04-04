//
//  Stripes.swift
//  SET
//
//  Created by Miguel Angel Hernandez Torrez on 4/4/21.
//

import SwiftUI

struct Stripes: Shape {
	
	func path(in rect: CGRect) -> Path {
		var p = Path()
		
		for i in 0..<numberOfLine{
			let xValue = rect.minX + rect.width * (CGFloat(i) / CGFloat(numberOfLine - 1))
			p.move(to: CGPoint(x: xValue, y: rect.minY))
			p.addLine(to: CGPoint(x: xValue - 5, y: rect.maxY))
		}
		
		return p
	}
	
	// MARK: - Drawing Variables
	private let numberOfLine = 15
}

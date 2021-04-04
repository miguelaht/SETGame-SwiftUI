//
//  Diamond.swift
//  SET
//
//  Created by Miguel Angel Hernandez Torrez on 4/4/21.
//

import SwiftUI

struct Diamond: Shape {
	
	func path(in rect: CGRect) -> Path {
		let top = CGPoint(x: rect.midX, y: rect.minY)
		let left = CGPoint(x: rect.minX, y: rect.midY)
		let bottom = CGPoint(x: rect.midX, y: rect.maxY)
		let right = CGPoint(x: rect.maxX, y: rect.midY)
		
		
		var p = Path()
		p.move(to: top)
		p.addLine(to: right)
		p.addLine(to: bottom)
		p.addLine(to: left)
		p.addLine(to: top)
		p.addLine(to: right)
		
		return p
	}
	
	
}

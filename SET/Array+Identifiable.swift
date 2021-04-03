//
//  Array+Identifiable.swift
//  SET
//
//  Created by Miguel Angel Hernandez Torrez on 3/4/21.
//

import Foundation

extension Array where Element: Identifiable{
	func firstIndex(matching: Element) -> Int? {
		for index in 0..<self.count{
			if self[index].id == matching.id{
				return index
			}
		}
		return nil
	}
}


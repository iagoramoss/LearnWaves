//
//  Float+octaves.swift
//
//
//  Created by Iago Ramos on 21/02/24.
//

import Foundation

extension Float {
    func addingOctaves(octaves: Int) -> Float {
        self * pow(2, Float(octaves))
    }
    
    func subtractingOctaves(octaves: Int) -> Float {
        self / pow(2, Float(octaves))
    }
}

//
//  Array<Float>+closestValue.swift
//
//
//  Created by Iago Ramos on 22/02/24.
//

import Foundation

extension Array<Float> {
    func closestValue(to value: Float) -> Float? {
        self.min {
            abs($0 - value) < abs($1 - value)
        }
    }
}

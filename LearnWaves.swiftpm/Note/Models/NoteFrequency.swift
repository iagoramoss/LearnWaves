//
//  NoteFrequency.swift
//  teste
//
//  Created by Iago Ramos on 17/02/24.
//

import Foundation

enum NoteFrequency: Float, CaseIterable {
    case C = 16.351
    case D = 18.354
    case E = 20.601
    case F = 21.827
    case G = 24.499
    case A = 27.5
    case B = 30.868
    
    static func from(frequency: Float, octave: inout Int) -> Self? {
        guard frequency > Self.C.rawValue else { return .C }
        
        if frequency <= Self.B.rawValue {
            let closestFrequency = Self.allCases.map({ $0.rawValue }).closestValue(to: frequency)
            return Self(rawValue: closestFrequency ?? 0)
        }
        
        octave += 1
        return from(frequency: frequency.subtractingOctaves(octaves: 1), octave: &octave)
    }
}

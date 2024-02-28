//
//  Waveform.swift
//  teste
//
//  Created by Iago Ramos on 17/02/24.
//

import Foundation
import SwiftUI

struct Waveform: Shape {
    let amplitude: Double
    let frequency: Double
    let scale: Double
    
    init(amplitude: Float, frequency: Float, scale: Float) {
        self.amplitude = Double(amplitude)
        self.frequency = Double(frequency)
        self.scale = Double(scale)
    }
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midHeight = height / 2
        
        let wavelength = (344 / frequency) * scale
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, to: width, by: 1) {
            let relativeX = x / wavelength
            let sine = sin(relativeX * .pi * 2)
            let y = (amplitude * scale) * sine + midHeight
            
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        return Path(path.cgPath)
    }
}

//
//  LearningAmplitude.swift
//
//
//  Created by Iago Ramos on 18/02/24.
//

import Foundation
import SwiftUI

struct LearningAmplitude: View {
    @EnvironmentObject private var coordinator: Coordinator<LearningRouter>
    @StateObject private var mixer = MixerViewModel(waves: Wave(amplitude: 0.5, frequency: 150, scale: 10))
    
    private let paragraphs = [
        "Amplitude directly impacts the sound's intensity: higher amplitude means louder sound.",
        
        "Usually measured in pascals (Pa) or decibels (dB), it indicates the pressure variation in the sound wave. Graphically, it's the vertical distance between the wave's highest and lowest points.",
        
        "In the example below with a frequency of 150Hz, notice how changing amplitude affects the sound wave and resulting sound.",
        
        "Remember, sound waves exceeding 85dB can be hazardous. For safety, the slider's limit is set to 85dB. It's also wise to lower your iPhone's volume."
    ]
    
    var body: some View {
        ScrollView {
            LearningView<WaveView, LearningRouter>(title: "Amplitude", paragraphs: paragraphs) {
                WaveView(wave: mixer.waves[0], hideFrequency: true) {
                    coordinator.push(.velocityAndLength)
                }
            }
        }
    }
}

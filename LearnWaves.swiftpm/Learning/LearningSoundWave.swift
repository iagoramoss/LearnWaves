//
//  LearningSoundWave.swift
//
//
//  Created by Iago Ramos on 18/02/24.
//

import Foundation
import SwiftUI

struct LearningSoundWave: View {
    @EnvironmentObject private var coordinator: Coordinator<LearningRouter>
    @StateObject private var mixer = MixerViewModel(waves: Wave(frequency: 150))
    
    private let paragraphs = [
        "Let's define a sound wave: it's a type of mechanical wave that needs a medium, like air, to travel through. Among the various types of sound waves, we'll focus on sine waves for now.",
        
        "Sound waves have key characteristics like Amplitude, Frequency, Velocity, and Wavelength, which we'll explore further.",
        
        "Here's a simple diagram to illustrate a sound wave. Next, we'll delve into manipulating these properties.",
        
        "Tip: tap \"Unmute\" to hear the sound the wave is making."
    ]
    
    var body: some View {
        ScrollView {
            LearningView<WaveView, LearningRouter>(title: "Sound Wave", paragraphs: paragraphs) {
                WaveView(
                    wave: mixer.waves[0],
                    hideAmplitude: true,
                    hideFrequency: true,
                    hideScale: true,
                    nextRouteAction: { coordinator.push(.frequency) }
                )
            }
        }
    }
}

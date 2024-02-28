//
//  LearningFrequency.swift
//
//
//  Created by Iago Ramos on 18/02/24.
//

import Foundation
import SwiftUI

struct LearningFrequency: View {
    @EnvironmentObject private var coordinator: Coordinator<LearningRouter>
    @StateObject private var mixer = MixerViewModel(waves: Wave(amplitude: 1, scale: 30))
    
    private let paragraphs = [
        "Frequency determines the pitch of a sound wave. Lower frequencies make lower tones, while higher frequencies make higher tones.",
        
        "It's measured in Hertz (Hz), indicating the number of cycles the wave completes per second. For example, 1Hz means one cycle per second.",
                
        "Notice how changing the value of the frequency affects the sound produced by a sound wave with an amplitude of 1dB:"
    ]
    
    var body: some View {
        ScrollView {
            LearningView<WaveView, LearningRouter>(title: "Frequency", paragraphs: paragraphs) {
                WaveView(wave: mixer.waves[0], hideAmplitude: true, hideScale: true) {
                    coordinator.push(.amplitude)
                }
            }
        }
    }
}

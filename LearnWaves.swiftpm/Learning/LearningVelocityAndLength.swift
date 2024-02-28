//
//  LearningVelocityAndLength.swift
//
//
//  Created by Iago Ramos on 19/02/24.
//

import Foundation
import SwiftUI

struct LearningVelocityAndLength: View {
    @EnvironmentObject private var coordinator: Coordinator<LearningRouter>
    @StateObject private var mixer = MixerViewModel(waves: Wave(amplitude: 1, scale: 30))
    
    private let paragraphs = [
        "To complete our understanding of sound waves, let's explore two more important concepts: velocity and wavelength.",
        
        "Velocity refers to the speed at which a sound wave moves through a medium, like air, water, or other liquids.",
        
        "Wavelength, on the other hand, is the distance between two crests (the highest points) or two troughs (the lowest points) of a wave.",
        
        "These concepts are connected through the formula: λ = V / F, where λ is the wavelength, V is the wave speed (assumed as 344 m/s), and F is the frequency."
    ]
    
    var body: some View {
        ScrollView {
            LearningView<WaveView, LearningRouter>(
                title: "Wavelength",
                paragraphs: paragraphs,
                content: {
                    WaveView(wave: mixer.waves[0], hideAmplitude: true, hideScale: true, showLength: true) {
                        coordinator.push(.musicalNotes)
                    }
                }
            )
            .padding(.top, 20)
        }
    }
}

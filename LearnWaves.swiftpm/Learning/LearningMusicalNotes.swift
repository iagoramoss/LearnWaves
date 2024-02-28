//
//  LearningMusicalNotes.swift
//
//
//  Created by Iago Ramos on 19/02/24.
//

import Foundation
import SwiftUI

struct LearningMusicalNotes: View {
    @StateObject private var mixer = MixerViewModel(waves: Wave(frequency: NoteFrequency.A.rawValue))
    
    private let paragraphs = [
        "But how does this connect to music? Well, music is essentially made up of sound waves, just like everything else we hear.",
        
        "And guess what? The same properties we discussed earlier also apply to musical notes! Let's quickly review.",
        
        "As mentioned, frequency determines the sound we perceive, while amplitude dictates its volume.",
                
        "So, let's see it all in action. In this wave, you can pick musical notes and their octaves to see how the wave behaves based on these properties:"
    ]
    
    var body: some View {
        ScrollView {
            LearningView<WaveView, LearningRouter>(title: "Musical Notes", paragraphs: paragraphs) {
                WaveView(wave: mixer.waves[0], hideFrequency: true, showNotes: true)
            }
        }
    }
}

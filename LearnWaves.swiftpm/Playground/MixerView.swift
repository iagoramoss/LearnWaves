//
//  MixerView.swift
//  
//
//  Created by Iago Ramos on 21/02/24.
//

import Foundation
import SwiftUI

struct MixerView: View {
    private let paragraphs = [
        "This is the mixer: where you can craft your own sound waves and tailor them to your preferences!",
                
        "Simply tap the plus button to create as many waves as you desire and play them simultaneously using the play button.",
                
        "To inspire you, here's an example of a well-known song to showcase the possibilities:"
    ]
    
    var body: some View {
        ScrollView {
            LearningView<WaveList, PlaygroundRouter>(title: "Mixer", paragraphs: paragraphs) {
                WaveList()
            }
        }
    }
}

fileprivate struct WaveList: View {
    @EnvironmentObject private var coordinator: Coordinator<PlaygroundRouter>
    @StateObject private var mixer = MixerViewModel(waves: .twinkle)
    
    var body: some View {
        VStack {
            ForEach(mixer.waves) { wave in
                WaveView(wave: wave, mixer: mixer, hideFrequency: true, showEdit: true)
                Divider()
            }
        }
        .toolbar {
            Button {
                mixer.isPlaying.toggle()
            } label: {
                let label = mixer.isPlaying ? "stop" : "play"
                
                Label(label, systemImage: "\(label).fill")
                    .labelStyle(.iconOnly)
            }

            Button {
                mixer.addWave(Wave(amplitude: 1, scale: 30))
            } label: {
                Label("create a new sound wave", systemImage: "plus")
                    .labelStyle(.iconOnly)
            }

        }
        .onDisappear {
            mixer.isPlaying = false
        }
    }
}

//
//  WaveView.swift
//
//
//  Created by Iago Ramos on 18/02/24.
//

import Foundation
import SwiftUI

struct WaveView: View {
    @EnvironmentObject var coordinator: Coordinator<PlaygroundRouter>
    
    @StateObject var wave: Wave
    var mixer: MixerViewModel? = nil
    
    var hideAmplitude = false
    var hideFrequency = false
    var hideScale = false
    var showNotes = false
    var showLength = false
    var showEdit = false
    
    var nextRouteAction: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            Waveform(amplitude: wave.amplitude, frequency: wave.frequency, scale: wave.scale)
                .stroke(Color.black, lineWidth: 1)
                .frame(height: 80)
                .clipped()
            
            WaveSlider(
                propertyName: "amplitude",
                unit: "dB",
                value: $wave.amplitude,
                isHidden: hideAmplitude,
                max: 85
            )
            
            WaveSlider(
                propertyName: "frequency",
                unit: "Hz",
                value: $wave.frequency,
                isHidden: hideFrequency
            )
            
            WaveSlider(
                propertyName: "scale",
                value: $wave.scale,
                isHidden: hideScale,
                min: 1,
                max: 100
            )
            
            if showNotes {
                FrequencyPicker(frequency: $wave.frequency)
                    .padding(.bottom, 10)
            }
            
            if showLength {
                Text("Wave Length: \(wave.length, specifier: "%.1f") m")
            }
            
            HStack {
                Toggle(wave.mute ? "Unmute" : "Mute", isOn: $wave.mute)
                    .toggleStyle(.button)
                    .buttonStyle(.bordered)
                
                if showEdit, let mixer = mixer {
                    Button {
                        coordinator.push(.editNotes(wave, mixer))
                    } label: {
                        Text("Edit")
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                if let nextRouteAction = nextRouteAction {
                    Button(action: nextRouteAction) {
                        Text("Next")
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding(.top, 10)
        }
        .onAppear { wave.isStarted = true }
        .onDisappear { wave.isStarted = false }
    }
}

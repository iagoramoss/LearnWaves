//
//  FrequencyPicker.swift
//
//
//  Created by Iago Ramos on 18/02/24.
//

import Foundation
import SwiftUI

struct FrequencyPicker: View {
    @Binding var frequency: Float
    
    private let frequencies = NoteFrequency.allCases
    @State private var selectedFrequency = NoteFrequency.C
    @State private var selectedOctave = 0
    
    private var newFrequency: Float {
        selectedFrequency.rawValue.addingOctaves(octaves: selectedOctave)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Note:")
                
                Picker("", selection: $selectedFrequency) {
                    ForEach(frequencies, id: \.self) { frequency in
                        Text(String(describing: frequency))
                    }
                }
                .labelsHidden()
                .onChange(of: selectedFrequency, perform: { _ in changeFrequency() })
                
                Text("Octave:")
                
                Picker("", selection: $selectedOctave) {
                    ForEach(0...9, id: \.self) { octave in
                        Text(octave.description)
                    }
                }
                .labelsHidden()
                .onChange(of: selectedOctave, perform: { _ in changeFrequency() })
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            let noteStr = String(describing: selectedFrequency)
            let octaveStr = String(describing: selectedOctave)
            
            Text("Frequência: \(frequency, specifier: "%.1f")Hz (\(noteStr)\(octaveStr))")
        }
        .onAppear {
            var octave = 0
            guard let frequency = NoteFrequency.from(frequency: frequency, octave: &octave) else {
                return
            }
            
            selectedFrequency = frequency
            selectedOctave = octave
            changeFrequency()
        }
    }
    
    private func changeFrequency() {
        guard frequency != newFrequency else { return }
        frequency = newFrequency
    }
}

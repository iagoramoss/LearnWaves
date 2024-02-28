//
//  Wave.swift
//  teste
//
//  Created by Iago Ramos on 17/02/24.
//

import Foundation
import AudioKit

final class Wave: ObservableObject, Identifiable {
    let id = UUID()
    let oscillator: PlaygroundOscillator
    
    @Published var notes: [Note]
    @Published var amplitude: Float { didSet { changeProperties() } }
    @Published var frequency: Float { didSet { changeProperties() } }
    @Published var mute: Bool { didSet { changeProperties() } }
    @Published var scale: Float
    
    @Published var isStarted: Bool = true {
        didSet {
            isStarted ? oscillator.start() : oscillator.stop()
        }
    }
    
    var length: Float {
        frequency == 0 ? 0 : 344 / frequency
    }
    
    init(notes: [Note] = [], amplitude: Float = 1, frequency: Float = 0, scale: Float = 30, mute: Bool = true) {
        oscillator = PlaygroundOscillator(waveform: Table(.sine), frequency: frequency, amplitude: amplitude)
        
        self.notes = notes
        self.amplitude = amplitude
        self.frequency = frequency
        self.scale = scale
        self.mute = mute
        
        oscillator.start()
        changeProperties()
    }
    
    private func changeProperties() {
        oscillator.amplitude = mute ? 0 : Float(amplitude)
        oscillator.frequency = mute ? 0 : Float(frequency)
    }
}

extension Wave: Hashable {
    static func == (lhs: Wave, rhs: Wave) -> Bool {
        lhs.id == rhs.id &&
        lhs.amplitude == rhs.amplitude &&
        lhs.frequency == rhs.frequency &&
        lhs.scale == rhs.scale &&
        lhs.isStarted == rhs.isStarted
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(amplitude)
        hasher.combine(frequency)
        hasher.combine(scale)
    }
}

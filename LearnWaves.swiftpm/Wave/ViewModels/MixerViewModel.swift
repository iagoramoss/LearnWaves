//
//  MixerViewModel.swift
//  WWDC2024_2
//
//  Created by Iago Ramos on 24/02/24.
//

import Foundation
import SwiftUI
import AudioKit

final class MixerViewModel: ObservableObject {
    private let audioEngine = AudioEngine()
    private let mixer = Mixer()
    
    @Published var waves: [Wave] = []
    
    @Published var isPlaying = false {
        didSet {
            isPlaying ? play() : stop()
        }
    }
    
    init(waves: Wave...) {
        waves.forEach{ addWave($0, start: true) }
        audioEngine.output = mixer
        
        do {
            try audioEngine.start()
            mixer.start()
        } catch {
            print("Error while starting AudioEngine: \(error.localizedDescription)")
        }
    }
    
    func addWave(_ wave: Wave, start: Bool = false) {
        wave.isStarted = start
        
        mixer.addInput(wave.oscillator)
        waves.append(wave)
    }
    
    func removeWave(_ wave: Wave) {
        wave.isStarted = false
        
        mixer.removeInput(wave.oscillator)
        waves.removeAll(where: { $0.id == wave.id })
    }
    
    func play() {
        waves.forEach { [weak self] wave in
            guard let self = self else { return }
            
            wave.mute = false
            wave.isStarted = true
            
            play(wave: wave)
        }
    }
    
    private func play(wave: Wave, note: Note? = nil) {
        guard isPlaying, let firstNote = wave.notes.first else { return }
        
        let note = note ?? firstNote
        wave.frequency = note.frequency
        
        DispatchQueue.main.asyncAfter(deadline: .now() + note.duration) { [weak self] in
            self?.play(wave: wave, note: wave.notes.nextElement(after: note))
        }
    }
    
    func stop() {
        waves.forEach { wave in
            wave.isStarted = false
            wave.mute = true
        }
    }
}

extension MixerViewModel: Hashable {
    static func == (lhs: MixerViewModel, rhs: MixerViewModel) -> Bool {
        lhs.waves == rhs.waves && lhs.isPlaying == rhs.isPlaying
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(waves)
        hasher.combine(isPlaying)
    }
}

//
//  Note+twinkle.swift
//
//
//  Created by Iago Ramos on 21/02/24.
//

import Foundation

extension Note {
    static func twinkle() -> [Note] {
        let baseInterval = 0.25
        
        return [
            Note(frequency: NoteFrequency.D.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            Note(frequency: 0, duration: baseInterval),
            Note(frequency: NoteFrequency.D.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            
            Note(frequency: 0, duration: baseInterval),
            
            Note(frequency: NoteFrequency.A.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            Note(frequency: 0, duration: baseInterval),
            Note(frequency: NoteFrequency.A.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            
            Note(frequency: 0, duration: baseInterval),
            
            Note(frequency: NoteFrequency.B.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            Note(frequency: 0, duration: baseInterval),
            Note(frequency: NoteFrequency.B.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            
            Note(frequency: 0, duration: baseInterval),
            Note(frequency: NoteFrequency.A.rawValue.addingOctaves(octaves: 4), duration: baseInterval * 3),
            Note(frequency: 0, duration: baseInterval),
            
            Note(frequency: NoteFrequency.G.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            Note(frequency: 0, duration: baseInterval),
            Note(frequency: NoteFrequency.G.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            
            Note(frequency: 0, duration: baseInterval),
            
            Note(frequency: NoteFrequency.F.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            Note(frequency: 0, duration: baseInterval),
            Note(frequency: NoteFrequency.F.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            
            Note(frequency: 0, duration: baseInterval),
            
            Note(frequency: NoteFrequency.E.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            Note(frequency: 0, duration: baseInterval),
            Note(frequency: NoteFrequency.E.rawValue.addingOctaves(octaves: 4), duration: baseInterval),
            
            Note(frequency: 0, duration: baseInterval),
            Note(frequency: NoteFrequency.D.rawValue.addingOctaves(octaves: 4), duration: baseInterval * 3),
            Note(frequency: 0, duration: baseInterval),
        ]
    }
}

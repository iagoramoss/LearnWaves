//
//  PlaygroundEditNotes.swift
//  
//
//  Created by Iago Ramos on 21/02/24.
//

import Foundation
import SwiftUI

struct PlaygroundEditNotes: View {
    @StateObject var mixer: MixerViewModel
    @StateObject var wave: Wave
    
    private let paragraphs = [
        "Here, you can design a sequence of frequencies to play on the sound wave. Each frequency will be played for the duration you specify.",
                
        "You can input frequencies manually or choose the musical note you desire!",
                
        "Tip: To create an interval between the frequencies played, simply add a frequency of 0Hz for the desired duration!"
    ]
    
    var body: some View {
        ScrollView {
            LearningView<NoteList, PlaygroundRouter>(title: "Edit Notes", paragraphs: paragraphs) {
                NoteList(mixer: mixer, wave: wave)
            }
        }
    }
}

fileprivate struct NoteList: View {
    @EnvironmentObject var coordinator: Coordinator<PlaygroundRouter>
    
    @StateObject var mixer: MixerViewModel
    @StateObject var wave: Wave
    
    @State private var presentAlert = false
    
    var body: some View {
        VStack {
            ForEach(wave.notes) { note in
                EditNote(note: note)
                    .padding(.top, 10)
                
                Divider()
            }
            .onDelete { indexSet in
                indexSet.forEach({ wave.notes.remove(at: $0) })
            }
        }
        .toolbar {
            Button {
                presentAlert.toggle()
            } label: {
                Label("delete wave", systemImage: "trash.fill")
                    .labelStyle(.iconOnly)
                    .tint(.red)
            }
            
            Button {
                wave.notes.append(Note(frequency: 0, duration: 0))
            } label: {
                Label("add note", systemImage: "plus")
                    .labelStyle(.iconOnly)
            }
        }
        .alert("Delete Wave", isPresented: $presentAlert) {
            Button("Cancel", role: .cancel) {
                presentAlert.toggle()
            }
            
            Button("Delete", role: .destructive) {
                presentAlert.toggle()
                coordinator.pop()
                mixer.removeWave(wave)
            }
        } message: {
            Text("Are you sure you want to delete this wave? This action cannot be undone.")
        }
        .padding(.top, 10)
    }
}

fileprivate struct EditNote: View {
    @StateObject var note: Note
    @State var isSlider = true
    
    var body: some View {
        VStack(alignment: .leading) {
            if isSlider {
                WaveSlider(
                    propertyName: "Frequency",
                    unit: "Hz",
                    value: $note.frequency,
                    isHidden: false
                )
            } else {
                FrequencyPicker(frequency: $note.frequency)
            }
            
            HStack {
                let label = "Duration (seconds):"
                
                let formatter: NumberFormatter = {
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal
                    return formatter
                }()
                
                Text(label)
                TextField(label, value: $note.duration, formatter: formatter)
                    .textFieldStyle(.roundedBorder)
            }
            
            HStack {
                let label = "Manual frequency:"
                
                Text(label)
                Toggle(label, isOn: $isSlider)
                    .labelsHidden()
            }
        }
    }
}

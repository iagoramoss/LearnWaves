//
//  Note.swift
//  teste
//
//  Created by Iago Ramos on 17/02/24.
//

import Foundation

final class Note: ObservableObject, Identifiable {
    let id = UUID()
    
    @Published var frequency: Float
    @Published var duration: Double
    
    init(frequency: Float, duration: Double) {
        self.frequency = frequency
        self.duration = duration
    }
}

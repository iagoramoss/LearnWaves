//
//  IntroductionSoundWave.swift
//
//
//  Created by Iago Ramos on 20/02/24.
//

import Foundation
import SwiftUI

struct IntroductionSoundWave: View {
    private let paragraphs = [
        "You've probably heard of sound waves, right? But do you know how they relate to the musical notes we know? Well, that's what we're going to find out today!"
    ]
    
    var body: some View {
        LearningView<EmptyView, LearningRouter>(
            title: "Sound Waves",
            paragraphs: paragraphs,
            nextRoute: .soundwave
        )
    }
}

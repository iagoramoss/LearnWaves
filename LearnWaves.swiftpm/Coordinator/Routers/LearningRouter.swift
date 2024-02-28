//
//  LearningRouter.swift
//
//
//  Created by Iago Ramos on 18/02/24.
//

import Foundation
import SwiftUI

enum LearningRouter: NavigationRouter {
    case introduction
    case soundwave
    case frequency
    case amplitude
    case velocityAndLength
    case musicalNotes
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .introduction:
            IntroductionSoundWave()
            
        case .soundwave:
            LearningSoundWave()
            
        case .frequency:
            LearningFrequency()
            
        case .amplitude:
            LearningAmplitude()
            
        case .velocityAndLength:
            LearningVelocityAndLength()
            
        case .musicalNotes:
            LearningMusicalNotes()
        }
    }
}

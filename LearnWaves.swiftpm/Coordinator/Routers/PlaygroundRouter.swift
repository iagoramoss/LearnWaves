//
//  PlaygroundRouter.swift
//
//
//  Created by Iago Ramos on 21/02/24.
//

import Foundation
import SwiftUI

enum PlaygroundRouter: NavigationRouter {
    case introduction
    case example
    case editNotes(Wave, MixerViewModel)
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .introduction:
            PlaygroundIntroduction()
            
        case .example:
            MixerView()
            
        case .editNotes(let wave, let mixer):
            PlaygroundEditNotes(mixer: mixer, wave: wave)
        }
    }
}

//
//  PlaygroundIntroduction.swift
//
//
//  Created by Iago Ramos on 21/02/24.
//

import Foundation
import SwiftUI

struct PlaygroundIntroduction: View {
    private let paragraphs = [
        "Welcome to the Playground section! Here, you can craft your own sound waves and personalize them to play whatever you like!",
                
        "Now that we understand what sound waves are and how they function, why not have some fun and create some music?"
    ]
    
    var body: some View {
        LearningView<EmptyView, PlaygroundRouter>(
            title: "Playground",
            paragraphs: paragraphs,
            nextRoute: .example
        )
    }
}

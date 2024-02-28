//
//  LearningView.swift
//
//
//  Created by Iago Ramos on 19/02/24.
//

import Foundation
import SwiftUI

struct LearningView<Content: View, Router: NavigationRouter>: View {
    @EnvironmentObject private var coordinator: Coordinator<Router>
    
    let title: String
    let paragraphs: [String]
    
    var nextRoute: Router? = nil
    var content: () -> Content? = { nil }
    
    var body: some View {
        VStack {
            Text(title)
                .font(.antipasto(size: .largeTitle))
            
            ForEach(paragraphs, id: \.self) { paragraph in
                Text(paragraph)
                    .font(.arcon(size: .body))
                    .modifier(CautionModifier(text: paragraph))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 5)
            
            content()?.padding(.top, 10)
            
            if let route = nextRoute {
                Button {
                    coordinator.push(route)
                } label: {
                    Text("Next")
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 10)
            }
        }
        .padding(.horizontal, .horizontalPadding)
    }
}

fileprivate struct CautionModifier: ViewModifier {
    let text: String
    
    func body(content: Content) -> some View {
        if text.contains("safety") {
            content
                .foregroundStyle(.red)
        } else {
            content
        }
    }
}

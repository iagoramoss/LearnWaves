//
//  Coordinator.swift
//
//
//  Created by Iago Ramos on 19/02/24.
//

import Foundation
import SwiftUI

final class Coordinator<Router: NavigationRouter>: ObservableObject {
    private let root: Router
    @Published fileprivate var path = NavigationPath()
    
    init(root: Router) {
        self.root = root
    }
    
    func push(_ route: Router) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    @ViewBuilder
    func start() -> some View {
        root.view()
            .modifier(RootModifier<Router>())
            .environmentObject(self)
    }
    
    @ViewBuilder
    fileprivate func view(from route: Router) -> some View {
        route.view()
            .environmentObject(self)
    }
}

fileprivate struct RootModifier<Router: NavigationRouter>: ViewModifier {
    @EnvironmentObject var coordinator: Coordinator<Router>
    
    func body(content: Content) -> some View {
        NavigationStack(path: $coordinator.path) {
            content
                .navigationDestination(for: Router.self) { destination in
                    coordinator.view(from: destination)
                }
        }
    }
}

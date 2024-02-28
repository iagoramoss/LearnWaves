import SwiftUI

@main
struct MyApp: App {
    @StateObject var learningCoordinator = Coordinator(root: LearningRouter.introduction)
    @StateObject var playgroundCoordinator = Coordinator(root: PlaygroundRouter.introduction)
    
    init() {
        FontManager.shared.registerFont(name: "antipasto.demibold", withExtension: "ttf")
        FontManager.shared.registerFont(name: "Arcon-Regular", withExtension: "otf")
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                learningCoordinator.start()
                    .tabItem {
                        Label("Sound Wave", systemImage: "waveform.path")
                    }
                
                playgroundCoordinator.start()
                    .tabItem {
                        Label("Playground", systemImage: "puzzlepiece.fill")
                    }
            }
            .preferredColorScheme(.light)
        }
    }
}

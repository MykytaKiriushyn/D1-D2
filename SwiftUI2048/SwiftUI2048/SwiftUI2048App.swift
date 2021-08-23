import SwiftUI

@main
struct SwiftUI2048App: App {
    var gameLogic = GameLogic()
    var body: some Scene {
        WindowGroup {
            GameView().environmentObject(gameLogic)
        }
    }
}

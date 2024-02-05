
import SwiftUI

@main
struct HedgieApp: App {
    @StateObject private var characterDataViewModel = CharacterDataViewModel()
    @StateObject private var skillDataViewModel = SkillDataViewModel()
    @State private var currentIndex = 0
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                FirstIntroPart(currentIndex: $currentIndex)
            }
            .environmentObject(characterDataViewModel)
            .environmentObject(skillDataViewModel)
        }
    }
}

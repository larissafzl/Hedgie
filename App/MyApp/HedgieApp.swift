
import SwiftUI

@main
struct HedgieApp: App {
    @StateObject private var characterDataViewModel = CharacterDataViewModel()
    @StateObject private var skillDataViewModel = SkillDataViewModel()
    @State private var currentIndex = 0
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                InitialMenu(initialIndex: currentIndex)
                    .onAppear {
                        print("Initial Index: \(currentIndex)")
                    }
                    .onChange(of: currentIndex) { newIndex in
                        print("Current Index: \(newIndex)")
                    }
            }
            .environmentObject(characterDataViewModel)
            .environmentObject(skillDataViewModel)
        }
    }
}

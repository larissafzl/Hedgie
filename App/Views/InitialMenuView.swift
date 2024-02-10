//
//  InitialMenu.swift
//
//
//  Created by Larissa Fazolin on 01/02/24.
//

import SwiftUI

struct InitialMenu: View {
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    @EnvironmentObject var skillDataViewModel: SkillDataViewModel
    @State private var currentIndex: Int

    init(initialIndex: Int) {
        self._currentIndex = State(initialValue: initialIndex)
        UINavigationBar.setAnimationsEnabled(false)
    }

    var body: some View {
        ZStack {
            InitialMenuBackground()
            
            InitialMenuComponents(currentIndex: $currentIndex)
            
            CharactersImage()
        }
        .onAppear {
            characterDataViewModel.resetCharacterData()
            skillDataViewModel.resetSkillsData()
            playGameSound(volume: 1)
        }
        .navigationBarBackButtonHidden(true)
    }

    func playGameSound(volume: Float) {
        SoundManager.instance.playSound(sound: .gameSoundtrack, volume: volume) { error in
            if let error = error {
                print("Error playing sound: \(error.localizedDescription)")
            } else {
                print("Sound played successfully")
            }
        }
    }
}

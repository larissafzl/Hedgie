//
//  InitialMenu.swift
//
//
//  Created by Larissa Fazolin on 01/02/24.
//

import SwiftUI

struct InitialMenu: View {
    @Binding var currentIndex: Int
    
    init(currentIndex: Binding<Int>) {
        _currentIndex = currentIndex
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        ZStack {
            InitialMenuBackground()
            
            InitialMenuComponents(currentIndex: $currentIndex)
            
            CharactersImage()
        }
        .onAppear {
            playGameSound(volume: 1)
        }
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

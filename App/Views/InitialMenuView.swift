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
            if !SoundManager.instance.currentSoundIs(.gameSoundtrack) {
                playGameSound(volume: 1, numberOfLoops: -1)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    func playGameSound(volume: Float, numberOfLoops: Int) {
        SoundManager.instance.playSound(sound: .gameSoundtrack, volume: volume, numberOfLoops: numberOfLoops) { error in
            if let error = error {
                print("Error playing sound: \(error.localizedDescription)")
            } else {
                print("Sound played successfully")
            }
        }
    }
}

struct AboutView: View {
    var body: some View {
        ZStack {
            InitialMenu(initialIndex: 0)
            
            ZStack {
                BlackBackground()
                
                BrownRectangle()
                    .overlay(
                        VStack(spacing: 16) {
                            Spacer()
                            
                            TutorialViewTitle(titleCalled: "about")
                            
                            VStack {
                                Text("The Hedgehog's Dilemma is a light-hearted game aiming to raise awareness about social anxiety, a mental disorder that affects over 150 thousand people in Brazil and countless more globally.\n\n I hope you enjoy playing it!\n")
                                
                                Text("Created by").italic()
                                Text("Larissa Fazolin")
                            }
                            .font(Font.custom("GillSans", size: 20))
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                            .multilineTextAlignment(.center)
                            
                            Spacer()
                        }
                    )
                    .overlay(
                        NavigationLink(destination: {
                            InitialMenu(initialIndex: 0)
                                .onAppear {
                                    playInterfaceSound()
                                }
                        }, label: {
                            TutorialArrow()
                                .padding(.bottom)
                        })
                    )
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    func playInterfaceSound() {
        EffectManager.instance.playSound(sound: .rightInterfaceEffect, volume: 0.8)
    }
}

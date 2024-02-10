//
//  BattleEndView.swift
//  
//
//  Created by Larissa Fazolin on 02/02/24.
//

import SwiftUI

// MARK: VictoryView

struct VictoryView: View {
    @State private var jumpUpHedge = false
    @State private var jumpUpOtter = false
    @State private var didAppear = false
    @State private var playInterfaceSound = false

    var body: some View {
        ZStack {
            LightBackground()

            VStack(spacing: 32) {
                Spacer()

                HStack(spacing: 32) {
                    CharacterImage(imageName: "happyHedge")
                        .offset(y: jumpUpHedge ? -5 : 5)
                        .onChange(of: didAppear) { _ in
                            withAnimation(Animation.easeInOut(duration: 0.1).repeatForever(autoreverses: true)) {
                                self.jumpUpHedge.toggle()
                            }
                        }
                        .onAppear {
                            didAppear = true
                        }

                    VictoryBalloon()

                    CharacterImage(imageName: "superHappyOtter")
                        .offset(y: jumpUpOtter ? -5 : 5)
                        .onChange(of: didAppear) { _ in
                            withAnimation(Animation.easeInOut(duration: 0.1).repeatForever(autoreverses: true)) {
                                self.jumpUpOtter.toggle()
                            }
                        }
                        .onAppear {
                            didAppear = true
                        }
                }

                TextBoxView()
                    .overlay(
                        VStack {
                            HStack {
                                Text("Hedgie").italic()
                                Text("tried his best and")
                                Text("Otty, the friendly friend,").italic()
                            }
                            HStack {
                                Text("had a great quality time with him!")
                            }
                        }
                        .font(Font.custom("GillSans", size: 20))
                    )
                    .overlay(
                        NavigationLink(destination: {
                            FirstEndView()
                        }, label: {
                            ArrowButtonView()
                        })
                        .simultaneousGesture(TapGesture().onEnded {
                            playInterfaceSound = true
                        })
                    )

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            SoundManager.instance.stopCurrentSound()
            playEndingSound(volume: 0.6, numberOfLoops: -1)
            EffectManager.instance.playSound(sound: .victoryEffect, volume: 0.8)
        }
        .onChange(of: playInterfaceSound) { newValue in
            if newValue {
                playRightInterfaceEffect()
                playInterfaceSound = false
            }
        }
    }

    func playEndingSound(volume: Float, numberOfLoops: Int) {
        SoundManager.instance.playSound(sound: .endingSoundtrack, volume: volume, numberOfLoops: numberOfLoops) { error in
            if let error = error {
                print("Error playing sound: \(error.localizedDescription)")
            } else {
                print("Sound played successfully")
            }
        }
    }
    
    func playRightInterfaceEffect() {
        EffectManager.instance.playSound(sound: .rightInterfaceEffect, volume: 0.8)
    }
}


// MARK: DefeatView

struct DefeatView: View {
    @State private var shake = false
    @State private var jumpUp = false
    @State private var didAppear = false
    @State private var playInterfaceSound = false

    var body: some View {
        ZStack {
            LightBackground()

            VStack(spacing: 32) {
                Spacer()

                HStack(spacing: 32) {
                    CharacterImage(imageName: "sadHedge")
                        .rotationEffect(Angle(degrees: shake ? -2 : 2))
                        .onChange(of: didAppear) { _ in
                            withAnimation(Animation.easeInOut(duration: 0.05).repeatForever(autoreverses: true)) {
                                self.shake.toggle()
                            }
                        }
                        .onAppear {
                            didAppear = true
                        }
                    
                    DefeatBalloon()
                    
                    CharacterImage(imageName: "hiOtter")
                        .offset(y: jumpUp ? -5 : 5)
                        .onChange(of: didAppear) { _ in
                            withAnimation(Animation.easeInOut(duration: 0.1).repeatForever(autoreverses: true)) {
                                self.jumpUp.toggle()
                            }
                        }
                        .onAppear {
                            didAppear = true
                        }
                }

                TextBoxView()
                    .overlay(
                        VStack {
                            HStack {
                                Text("Hedgie's").italic()
                                Text("social energy was drained and he needed to go.")
                            }
                            HStack {
                                Text("But that's okay.")
                                Text("Otty, the friendly friend,").italic()
                                Text("understands.")
                            }
                        }
                        .font(Font.custom("GillSans", size: 20))
                    )
                    .overlay(
                        NavigationLink(destination: {
                            FirstEndView()
                        }, label: {
                            ArrowButtonView()
                        })
                        .simultaneousGesture(TapGesture().onEnded {
                            playInterfaceSound = true
                        })
                    )

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            SoundManager.instance.stopCurrentSound()
            playEndingSound(volume: 0.6)
            EffectManager.instance.playSound(sound: .defeatEffect, volume: 0.3)
        }
        .onChange(of: playInterfaceSound) { newValue in
            if newValue {
                playRightInterfaceEffect()
                playInterfaceSound = false
            }
        }
    }

    func playEndingSound(volume: Float) {
        SoundManager.instance.playSound(sound: .endingSoundtrack, volume: volume) { error in
            if let error = error {
                print("Error playing sound: \(error.localizedDescription)")
            } else {
                print("Sound played successfully")
            }
        }
    }
    
    func playRightInterfaceEffect() {
        EffectManager.instance.playSound(sound: .rightInterfaceEffect, volume: 0.8)
    }
}





// MARK: - EndView

struct FirstEndView: View {
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        ZStack {
            LightBackground()
        
            VStack(spacing: 32) {
                Spacer()
                
                CharacterImageStandard(imageName: "hedge")
                TextBoxView()
                    .overlay(
                        HStack {
                            Text("In any way,")
                            Text("Hedgie").italic()
                            Text("is very grateful for your help!")
                        }
                        .font(Font.custom("GillSans", size: 20))
                    )
                    .overlay(
                        NavigationLink(destination: {
                            SecondEndView()
                        }, label: {
                            ArrowButtonView()
                        })
                    )
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            playRightInterfaceEffect()
        }
    }
    
    func playRightInterfaceEffect() {
        EffectManager.instance.playSound(sound: .rightInterfaceEffect, volume: 0.8)
    }
}


struct SecondEndView: View {
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        ZStack {
            LightBackground()
        
            VStack(spacing: 32) {
                Spacer()
                
                CharacterImageStandard(imageName: "happyHedge")
                TextBoxView()
                    .overlay(
                        Text("He will keep on trying until it gets better.")
                            .font(Font.custom("GillSans", size: 20))
                    )
                    .overlay(
                        NavigationLink(destination: {
                            CreditsView()
                        }, label: {
                            ArrowButtonView()
                        })
                    )
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            playRightInterfaceEffect()
        }
    }
    
    func playRightInterfaceEffect() {
        EffectManager.instance.playSound(sound: .rightInterfaceEffect, volume: 0.8)
    }
}

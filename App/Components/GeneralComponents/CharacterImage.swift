//
//  CharacterImage.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct CharacterImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 210, height: 195)
    }
}

struct CharacterImageStandard: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 210, height: 195)
    }
}

struct CharacterImageSmall: View {
    var imageName: String
    @State private var shake = false
    @State private var jumpUp = false
    @State private var didAppear = false
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 165)
            .rotationEffect(Angle(degrees: shake ? -1.5 : 1.5))
            .offset(y: jumpUp ? -5 : 5)
            .onChange(of: didAppear) { _ in
                if imageName == "sadHedge" {
                    withAnimation(Animation.easeInOut(duration: 0.05).repeatForever(autoreverses: true)) {
                        self.shake.toggle()
                    }
                } else if imageName == "happyOtter" {
                    withAnimation(Animation.easeInOut(duration: 0.1).repeatForever(autoreverses: true)) {
                        self.jumpUp.toggle()
                    }
                }
            }
            .onAppear {
                didAppear = true
            }
    }
}

struct GetCharacterImage: View {
    @Binding var currentIndex: Int
    var imageName: String
    
    var body: some View {
        Image(content[currentIndex].imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 210, height: 195)
    }
}

struct HedgieBattleImage: View {
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    var imageName: String
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                CharacterImageSmall(imageName: imageName)
                    .padding(.vertical, 50)
                    .padding(.horizontal, -20)
                    .overlay(
                        StatsBalloonLeft(character: characterDataViewModel.hedgie)
                    )
                
                Spacer()
            }
        }
    }
}

struct EnemyBattleImage: View {
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    var imageName: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                CharacterImageSmall(imageName: imageName)
                    .padding(.vertical, 50)
                    .padding(.horizontal, -20)
                    .overlay(
                        StatsBalloonRight(character: characterDataViewModel.otty)
                    )
            }
            
            Spacer()
        }
    }
}

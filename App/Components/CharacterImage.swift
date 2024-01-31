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

struct CharacterImageSmall: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 180, height: 165)
    }
}

// Gets and displays character images based on the current index
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
    @ObservedObject var characterDataViewModel: CharacterDataViewModel
    var imageName: String
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                CharacterImageSmall(imageName: imageName)
                    .padding(.vertical, 50)
                    .padding(.horizontal, -20)
                    .overlay(
                        StatsBalloonLeft(characterDataViewModel: characterDataViewModel, character: characterDataViewModel.hedgie)
                    )
                
                Spacer()
            }
        }
    }
}

struct EnemyBattleImage: View {
    @ObservedObject var characterDataViewModel: CharacterDataViewModel
    var imageName: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                CharacterImageSmall(imageName: imageName)
                    .padding(.vertical, 50)
                    .padding(.horizontal, -20)
                    .overlay(
                        StatsBalloonRight(characterDataViewModel: characterDataViewModel, character: characterDataViewModel.otty)
                    )
            }
            
            Spacer()
        }
    }
}

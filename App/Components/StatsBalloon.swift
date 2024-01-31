//
//  StatsBalloon.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct StatsBalloonLeft: View {
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    @ObservedObject var character: CharacterData
    
    var body: some View {
        Image("balloonLeft")
            .resizable()
            .scaledToFill()
            .frame(width: 195, height: 110)
            .padding(.leading, 300)
            .padding(.bottom, 200)
            .overlay(
                HedgieStatsView(character: characterDataViewModel.hedgie)
            )
    }
}

struct StatsBalloonRight: View {
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    @ObservedObject var character: CharacterData
    
    var body: some View {
        Image("balloonRight")
            .resizable()
            .scaledToFill()
            .frame(width: 195, height: 110)
            .padding(.trailing, 300)
            .padding(.bottom, 150)
            .overlay(
                EnemyStatsView(character: characterDataViewModel.otty)
            )
    }
}

struct HedgieStatsView: View {
    @ObservedObject var character: CharacterData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("\(character.name)")
                .font(Font.custom("GillSans", size: 20)).italic()
            
            HStack(spacing: 16) {
                Text("\(character.lifeType == .socialEnergy ? "Social Energy" : "Quality Time")")
                Text(String(format: "%.0f/%.0f", character.currentLife, character.totalLife))
            }
            .font(Font.custom("GillSans", size: 14))
            
            ProgressView(value: character.currentLife / character.totalLife)
                .frame(width: 135)
                .tint(character.lifeType == .socialEnergy ? Color("blue") : Color("red"))
            
            Spacer()
        }
        .padding(.leading, 300)
        .padding(.top, 23)
    }
}

struct EnemyStatsView: View {
    @ObservedObject var character: CharacterData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("\(character.name)")
                .font(Font.custom("GillSans", size: 20)).italic()
            
            HStack(spacing: 16) {
                Text("\(character.lifeType == .socialEnergy ? "Social Energy" : "Quality Time")")
                Text(String(format: "%.0f/%.0f", character.currentLife, character.totalLife))
            }
            .font(Font.custom("GillSans", size: 14))
            
            ProgressView(value: character.currentLife / character.totalLife)
                .frame(width: 135)
                .tint(character.lifeType == .socialEnergy ? Color("blue") : Color("red"))
            
            Spacer()
        }
        .padding(.trailing, 320)
        .padding(.top, 23)
    }
}

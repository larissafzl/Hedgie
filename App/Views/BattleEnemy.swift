//
//  BattleEnemy.swift
//  
//
//  Created by Larissa Fazolin on 30/01/24.
//

import SwiftUI

struct BattleEnemy: View {
    @StateObject private var characterDataViewModel = CharacterDataViewModel()
    @StateObject private var skillDataViewModel = SkillDataViewModel()
    @State private var goToNextView = false
    
    var body: some View {
        ZStack {
            Background()
            
            TurnBoxEnemy()
            
            HedgieBattleImage(viewModel: characterDataViewModel, imageName: "sadHedge")
            
            EnemyBattleImage(viewModel: characterDataViewModel, imageName: "otter")
            
            TextBoxBattleEnemy()
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                goToNextView = true
            }
        }
        .background(
            NavigationLink(destination: BattleView(), isActive: $goToNextView) {
                EmptyView()
            }
            .hidden()
        )
    }
}

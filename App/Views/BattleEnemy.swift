//
//  BattleEnemy.swift
//  
//
//  Created by Larissa Fazolin on 30/01/24.
//

import SwiftUI

struct BattleEnemy: View {
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    @EnvironmentObject var skillDataViewModel: SkillDataViewModel
    @State private var goToNextView = false
    
    var body: some View {
        ZStack {
            Background()
            
            TurnBoxEnemy()
            
            HedgieBattleImage(imageName: "sadHedge")
            
            EnemyBattleImage(imageName: "otter")
            
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

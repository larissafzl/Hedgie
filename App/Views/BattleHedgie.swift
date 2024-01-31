//
//  BattleHedgie.swift
//
//
//  Created by Larissa Fazolin on 30/01/24.
//

import SwiftUI

struct BattleHedgie: View {
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    @EnvironmentObject var skillDataViewModel: SkillDataViewModel
    @State private var goToNextView = false
    
    var body: some View {
        ZStack {
            Background()
            
            TurnBoxHedgie()
            
            HedgieBattleImage(imageName: "hedge")
            
            EnemyBattleImage(imageName: "happyOtter")
            
            TextBoxBattleHedgie()
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                goToNextView = true
            }
        }
        .background(
            NavigationLink(destination: BattleEnemy(), isActive: $goToNextView) {
                EmptyView()
            }
            .hidden()
        )
    }
}

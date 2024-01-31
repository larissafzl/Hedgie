//
//  BattleHedgie.swift
//
//
//  Created by Larissa Fazolin on 30/01/24.
//

import SwiftUI

struct BattleHedgie: View {
    @StateObject private var characterDataViewModel = CharacterDataViewModel()
    @StateObject private var skillDataViewModel = SkillDataViewModel()
    @State private var goToNextView = false
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        ZStack {
            Background()
            
            TurnBoxHedgie()
            
            HedgieBattleImage(viewModel: characterDataViewModel, imageName: "hedge")
            
            EnemyBattleImage(viewModel: characterDataViewModel, imageName: "happyOtter")
            
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

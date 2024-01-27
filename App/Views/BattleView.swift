//
//  BattleView.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct BattleView: View {
    @StateObject private var characterDataViewModel = CharacterDataViewModel()
    @StateObject private var skillDataViewModel = SkillDataViewModel()
    
    var body: some View {
        ZStack {
            Background()
            
            TurnBox()
            
            HedgieBattleImage(viewModel: characterDataViewModel)
            
            EnemyBattleImage(viewModel: characterDataViewModel, imageName: "otter")
            
            Hotbar(viewModel: skillDataViewModel)
        }
        .navigationBarBackButtonHidden(true)
    }
}

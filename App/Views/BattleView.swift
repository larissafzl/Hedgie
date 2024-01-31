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
            
            TurnBoxHedgie()
            
            HedgieBattleImage(characterDataViewModel: characterDataViewModel, imageName: "hedge")
            
            EnemyBattleImage(characterDataViewModel: characterDataViewModel, imageName: "otter")
            
            Hotbar(skillDataViewModel: skillDataViewModel, characterDataViewModel: characterDataViewModel)
        }
        .navigationBarBackButtonHidden(true)
    }
}

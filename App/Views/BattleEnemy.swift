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
    @State private var randomSkill: SkillData?
    @State private var goToNextView = false
    @State private var goToDefeatView = false

    var body: some View {
        ZStack {
            Background()

            TurnBoxEnemy()

            HedgieBattleImage(imageName: "sadHedge")

            EnemyBattleImage(imageName: "otter")

            TextBoxBattleEnemy(skillName: randomSkill?.skillName ?? "")
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            let ottySkills = OttySkillData()
            let skillsArray = [ottySkills.skillOne, ottySkills.skillTwo, ottySkills.skillThree, ottySkills.skillFour]
            self.randomSkill = skillsArray.randomElement()

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if let skill = randomSkill {
                    self.updateCharacterLife(for: characterDataViewModel.hedgie, with: skill.strength)
                }
                
                if characterDataViewModel.hedgie.currentLife == 0 {
                    goToDefeatView = true
                }
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                goToNextView = true
            }
        }
        .background(
            Group {
                if goToDefeatView {
                    NavigationLink(destination: DefeatView(), isActive: $goToDefeatView) {
                        EmptyView()
                    }
                    .hidden()
                } else {
                    NavigationLink(destination: BattleView(), isActive: $goToNextView) {
                        EmptyView()
                    }
                    .hidden()
                }
            }
        )
    }

    private func updateCharacterLife(for character: CharacterData, with damage: Double) {
        if character.currentLife - damage > 0 {
            character.currentLife -= damage
        } else {
            character.currentLife = 0
        }
    }
}

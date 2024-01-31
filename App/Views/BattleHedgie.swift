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
    @Binding var activeButton: SkillData?
    @State private var copiedActiveButton: SkillData?
    @State private var goToNextView = false
    
    var body: some View {
        ZStack {
            Background()
            
            TurnBoxHedgie()
            
            HedgieBattleImage(imageName: "hedge")
            
            EnemyBattleImage(imageName: "happyOtter")
            
            TextBoxBattleHedgie(activeButton: $copiedActiveButton)
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            UINavigationBar.setAnimationsEnabled(false)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                goToNextView = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                handleConfirmation()
            }
            
            copiedActiveButton = activeButton
        }
        .background(
            NavigationLink(destination: BattleEnemy(), isActive: $goToNextView) {
                EmptyView()
            }
            .hidden()
        )
    }
    
    private func handleConfirmation() {
        if let activeButton = activeButton {
            print("Button clicked for \(activeButton.skillName)")

            skillDataViewModel.confirmedSkills[activeButton] = true

            if activeButton.type == .offensive {
                updateCharacterLife(characterDataViewModel.otty)
            } else {
                updateCharacterLife(characterDataViewModel.hedgie)
            }

            self.activeButton = nil
            skillDataViewModel.decreaseCooldowns()
            printConfirmedSkills()
        }
    }

    private func updateCharacterLife(_ character: CharacterData) {
        if character.currentLife + activeButton!.strength <= character.totalLife {
            character.currentLife += activeButton!.strength
        } else {
            character.currentLife = character.totalLife
        }
    }

    private func printConfirmedSkills() {
        print("Confirmed Skills:")
        for (skill, confirmed) in skillDataViewModel.confirmedSkills where confirmed {
            print(skill.skillName)
        }
    }
}

//    private func handleConfirmation() {
//        if let activeButton = activeButton {
//            print("Button clicked for \(activeButton.skillName)")
//
//            skillDataViewModel.confirmedSkills[activeButton] = true
//
//            if activeButton.type == .offensive {
//                updateCharacterLife(characterDataViewModel.otty)
//            } else {
//                updateCharacterLife(characterDataViewModel.hedgie)
//            }
//
//            self.activeButton = nil
//            skillDataViewModel.decreaseCooldowns()
//            printConfirmedSkills()
//        }
//    }
//
//    private func updateCharacterLife(_ character: CharacterData) {
//        if character.currentLife + activeButton!.strength <= character.totalLife {
//            character.currentLife += activeButton!.strength
//        } else {
//            character.currentLife = character.totalLife
//        }
//    }
//
//    private func printConfirmedSkills() {
//        print("Confirmed Skills:")
//        for (skill, confirmed) in skillDataViewModel.confirmedSkills where confirmed {
//            print(skill.skillName)
//        }
//    }

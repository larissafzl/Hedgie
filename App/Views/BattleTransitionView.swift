//
//  BattleTransitionView.swift
//
//
//  Created by Larissa Fazolin on 02/02/24.
//

import SwiftUI

// MARK: - BattleHedgie

struct BattleHedgie: View {
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    @EnvironmentObject var skillDataViewModel: SkillDataViewModel
    @Binding var activeButton: SkillData?
    @State private var copiedActiveButton: SkillData?
    @State private var goToNextView = false
    @State private var goToVictoryView = false

    var body: some View {
        ZStack {
            DarkBackground()
            TurnBoxHedgie()
            if copiedActiveButton?.type == .offensive { // Remove the $ symbol here
                HedgieBattleImage(imageName: "hedge")
                EnemyBattleImage(imageName: "happyOtter")
            } else {
                HedgieBattleImage(imageName: "happyHedge")
                EnemyBattleImage(imageName: "otter")
            }
            TextBoxBattleHedgie(activeButton: $copiedActiveButton)
        }

        .navigationBarBackButtonHidden(true)
        .onAppear {
            disableNavigationBarAnimations()
            handleTimedActions()
            copiedActiveButton = activeButton
        }
        .background(destinationNavigationLink())
    }

    private func disableNavigationBarAnimations() {
        UINavigationBar.setAnimationsEnabled(false)
    }

    private func handleTimedActions() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            handleNextViewNavigation()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            handleConfirmation()
        }
    }

    private func handleNextViewNavigation() {
        if characterDataViewModel.otty.currentLife == characterDataViewModel.otty.totalLife {
            goToVictoryView = true
            return
        }
        goToNextView = true
    }


    private func handleConfirmation() {
        if let activeButton = activeButton {
            print("Button clicked for \(activeButton.skillName), Type: \(activeButton.type)")
            skillDataViewModel.confirmedSkills[activeButton] = true

            if activeButton.type == .offensive {
                updateCharacterLife(characterDataViewModel.otty)
                EffectManager.instance.playSound(sound: .hedgieAttack)
            } else {
                updateCharacterLife(characterDataViewModel.hedgie)
                EffectManager.instance.playSound(sound: .hedgieDefense, volume: 0.2)
            }

            self.activeButton = nil
            skillDataViewModel.decreaseCooldowns()
            printConfirmedSkills()
        }
    }

    private func updateCharacterLife(_ character: CharacterData) {
        if let activeButton = activeButton, character.currentLife + activeButton.strength <= character.totalLife {
            character.currentLife += activeButton.strength
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

    private func destinationNavigationLink() -> some View {
        Group {
            if goToVictoryView {
                NavigationLink(destination: VictoryView(), isActive: $goToVictoryView) {
                    EmptyView()
                }
                .hidden()
            } else {
                NavigationLink(destination: BattleEnemy(), isActive: $goToNextView) {
                    EmptyView()
                }
                .hidden()
            }
        }
    }
}

// MARK: - BattleEnemy

struct BattleEnemy: View {
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    @EnvironmentObject var skillDataViewModel: SkillDataViewModel
    @State private var randomSkill: SkillData?
    @State private var goToNextView = false
    @State private var goToDefeatView = false

    var body: some View {
        ZStack {
            DarkBackground()
            TurnBoxEnemy()
            HedgieBattleImage(imageName: "sadHedge")
            EnemyBattleImage(imageName: "otter")
            TextBoxBattleEnemy(skillName: randomSkill?.skillName ?? "")
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            setupRandomSkill()
            performCharacterLifeUpdate()
            navigateToNextView()
        }
        .background(destinationNavigationLink())
    }

    private func setupRandomSkill() {
        let ottySkills = OttySkillData()
        let skillsArray = [ottySkills.skillOne, ottySkills.skillTwo, ottySkills.skillThree, ottySkills.skillFour]
        self.randomSkill = skillsArray.randomElement()
    }

    private func performCharacterLifeUpdate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let skill = randomSkill {
                self.updateCharacterLife(for: characterDataViewModel.hedgie, with: skill.strength)
                EffectManager.instance.playSound(sound: .enemyAttack)
            }
        }
    }


    private func navigateToNextView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            if characterDataViewModel.hedgie.currentLife == 0 {
                goToDefeatView = true
            }
            goToNextView = true
        }
    }

    private func updateCharacterLife(for character: CharacterData, with damage: Double) {
        if character.currentLife - damage > 0 {
            character.currentLife -= damage
        } else {
            character.currentLife = 0
        }
    }

    private func destinationNavigationLink() -> some View {
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
    }
}

//
//  SkillButton.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct Cooldown: View {
    @ObservedObject var skill: SkillData
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                cooldownOverlay
            }
            .padding(.bottom, 120)
            
            Spacer()
        }
    }

    private var cooldownOverlay: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color("yellow"))
            .frame(width: 60, height: 40)
            .overlay(
                HStack {
                    Text(String(format: "%.0f", skill.cooldown))
                    Image(systemName: "clock")
                }
                .font(Font.custom("GillSans", size: 16))
            )
    }
}

struct SkillLoading: View {
    @ObservedObject var skill: SkillData
    @ObservedObject var viewModel: SkillDataViewModel

    var body: some View {
        if viewModel.confirmedSkills[skill] == true && skill.remainingCooldown > 0 {
            loadingOverlay
        }
    }

    private var loadingOverlay: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color.black.opacity(0.5))
            .overlay(
                Text(String(format: "%.0f", skill.remainingCooldown))
                    .font(Font.custom("GillSans", size: 90))
                    .foregroundColor(.white)
            )
    }
}

struct SkillButton: View {
    @ObservedObject var skill: SkillData
    @Binding var activeButton: SkillData?
    @ObservedObject var viewModel: SkillDataViewModel

    var body: some View {
        buttonContent
            .onTapGesture {
                activeButton = (activeButton == skill) ? nil : skill
            }
            .disabled(viewModel.confirmedSkills[skill] == true)
    }

    private var buttonContent: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(skill.type == .defensive ? Color("blue") : Color("red"))
            .frame(width: 110, height: 110)
            .overlay(buttonOverlay)
    }

    private var buttonOverlay: some View {
        RoundedRectangle(cornerRadius: 30)
            .stroke(activeButton == skill ? Color.black.opacity(0.5) : Color.clear, lineWidth: 1)
            .shadow(color: activeButton == skill ? .black.opacity(0.5) : .clear, radius: 5, x: 0, y: 5)
            .overlay(SkillButtonText(skill: skill))
            .overlay(SkillLoading(skill: skill, viewModel: viewModel))
            .overlay(activeButton == skill ? Cooldown(skill: skill) : nil)
    }
}

struct SkillButtons: View {
    @ObservedObject var viewModel: SkillDataViewModel
    @Binding var activeButton: SkillData?

    var body: some View {
        VStack {
            Spacer()

            HStack(spacing: 5) {
                SkillButton(skill: viewModel.skillOne, activeButton: $activeButton, viewModel: viewModel)
                SkillButton(skill: viewModel.skillTwo, activeButton: $activeButton, viewModel: viewModel)
                SkillButton(skill: viewModel.skillThree, activeButton: $activeButton, viewModel: viewModel)
                SkillButton(skill: viewModel.skillFour, activeButton: $activeButton, viewModel: viewModel)
            }
        }
    }
}

struct SkillButtonText: View {
    @ObservedObject var skill: SkillData
    
    var body: some View {
        VStack {
            Text("\(skill.skillName)")
                .font(Font.custom("GillSans", size: 20)).italic()
                .frame(height: 50)
                .multilineTextAlignment(.center)

            Divider()
                .frame(width: 100)
                .background(.black)
                .padding(.top, -8)
            
            skillDescription
        }
        .padding(.horizontal, 6)
        .padding(.bottom, 6)
    }

    private var skillDescription: some View {
        HStack {
            Text(skill.strength == 0 ? "" : String(format: "+%.0f", skill.strength))
                .font(Font.custom("GillSans", size: 14))
                .multilineTextAlignment(.center)
            
            Text("\(skill.description)")
                .font(Font.custom("GillSans", size: 14))
                .multilineTextAlignment(.center)
        }
        .padding(.top, -11)
    }
}

struct ConfirmButton: View {
    @Binding var activeButton: SkillData?
    @ObservedObject var characterDataViewModel: CharacterDataViewModel
    @ObservedObject var skillDataViewModel: SkillDataViewModel
    
    var body: some View {
        VStack {
            Spacer()
            confirmButton
        }
    }

    private var confirmButton: some View {
        Button(action: {
            handleConfirmation()
        }) {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("orange"))
                .frame(width: 110, height: 40)
                .overlay(
                    Text("Confirm")
                        .font(Font.custom("GillSans", size: 20))
                        .foregroundColor(.black)
                )
        }
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(activeButton == nil ? Color.black.opacity(0.5) : Color.clear)
        )
        .disabled(activeButton == nil)
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

struct Hotbar: View {
    @ObservedObject var skillDataViewModel: SkillDataViewModel
    @ObservedObject var characterDataViewModel: CharacterDataViewModel
    @State private var activeButton: SkillData? = nil
    
    var body: some View {
        HStack(spacing: 5) {
            SkillButtons(viewModel: skillDataViewModel, activeButton: $activeButton)
            ConfirmButton(activeButton: $activeButton, characterDataViewModel: characterDataViewModel, skillDataViewModel: skillDataViewModel)
        }
        .padding(.leading, 110)
    }
}

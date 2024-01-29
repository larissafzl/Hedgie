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
            .padding(.bottom, 120)
            
            Spacer()
        }
    }
}

struct SkillLoading: View {
    @ObservedObject var skill: SkillData
    @ObservedObject var viewModel: SkillDataViewModel

    var body: some View {
        print("\(skill.skillName) Remaining Cooldown: \(skill.remainingCooldown)")

        return viewModel.confirmedSkills[skill] == true && skill.remainingCooldown > 0 ?
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color.black.opacity(0.5))
                .overlay(
                    Text(String(format: "%.0f", skill.remainingCooldown))
                        .font(Font.custom("GillSans", size: 90))
                        .foregroundColor(.white)
                )
            : nil
    }
}

struct SkillButton: View {
    @ObservedObject var skill: SkillData
    @Binding var activeButton: SkillData?
    @ObservedObject var viewModel: SkillDataViewModel

    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(skill.type == .defensive ? Color("blue") : Color("red"))
            .frame(width: 110, height: 110)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(activeButton == skill ? Color.black.opacity(0.5) : Color.clear, lineWidth: 1)
            )
            .shadow(color: activeButton == skill ? .black.opacity(0.5) : .clear, radius: 5, x: 0, y: 5)
            .overlay(
                SkillButtonText(skill: skill)
            )
            .overlay(
                SkillLoading(skill: skill, viewModel: viewModel)
            )
            .overlay(
                activeButton == skill ? Cooldown(skill: skill) : nil
            )
            .onTapGesture {
                if activeButton == skill {
                    activeButton = nil
                } else {
                    activeButton = skill
                }
            }
            .disabled(viewModel.confirmedSkills[skill] == true)
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
            VStack {
                Text("\(skill.skillName)")
                    .font(Font.custom("GillSans", size: 20)).italic()
                    .frame(height: 50)
                    .multilineTextAlignment(.center)

                Divider()
                    .frame(width: 100)
                    .background(.black)
                    .padding(.top, -8)
            }
            
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
        .padding(.horizontal, 6)
        .padding(.bottom, 6)
    }
}

struct ConfirmButton: View {
    @Binding var activeButton: SkillData?
    @ObservedObject var characterDataViewModel: CharacterDataViewModel
    @ObservedObject var skillDataViewModel: SkillDataViewModel
    
    // Function to print confirmed skills
    func printConfirmedSkills() {
        print("Confirmed Skills:")
        for (skill, confirmed) in skillDataViewModel.confirmedSkills {
            if confirmed {
                print(skill.skillName)
            }
        }
    }

    var body: some View {
        VStack {
            Spacer()

            Button(action: {
                if let activeButton = activeButton {
                    print("Button clicked for \(activeButton.skillName)")

                    // Handle confirmation logic here
                    skillDataViewModel.confirmedSkills[activeButton] = true

                    if activeButton.type == .offensive {
                        // Check if adding the skill strength exceeds the total life
                        if characterDataViewModel.otty.currentLife + activeButton.strength <= characterDataViewModel.otty.totalLife {
                            characterDataViewModel.otty.currentLife += activeButton.strength
                        } else {
                            characterDataViewModel.otty.currentLife = characterDataViewModel.otty.totalLife
                        }
                    } else {
                        // Check if adding the skill strength exceeds the total life
                        if characterDataViewModel.hedgie.currentLife + activeButton.strength <= characterDataViewModel.hedgie.totalLife {
                            characterDataViewModel.hedgie.currentLife += activeButton.strength
                        } else {
                            characterDataViewModel.hedgie.currentLife = characterDataViewModel.hedgie.totalLife
                        }
                    }

                    // Deselect the activeButton after confirming
                    self.activeButton = nil
                    
                    // Decrease the remaining cooldowns for all skills
                    skillDataViewModel.decreaseCooldowns()
                    
                    // Print confirmed skills
                    printConfirmedSkills()
                }
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

//
//  SkillButton.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

// MARK: - Cooldown View

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

// MARK: - SkillLoading View

struct SkillLoading: View {
    @ObservedObject var skill: SkillData
    @EnvironmentObject var skillDataViewModel: SkillDataViewModel

    var body: some View {
        if skillDataViewModel.confirmedSkills[skill] == true && skill.remainingCooldown > 0 {
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

// MARK: - SkillButton View

struct SkillButton: View {
    @ObservedObject var skill: SkillData
    @Binding var activeButton: SkillData?
    @EnvironmentObject var skillDataViewModel: SkillDataViewModel

    var body: some View {
        buttonContent
            .onTapGesture {
                activeButton = (activeButton == skill) ? nil : skill
            }
            .disabled(skillDataViewModel.confirmedSkills[skill] == true)
    }

    private var buttonContent: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(skill.type == .defensive ? Color("blue") : Color("red"))
            .frame(width: 110, height: 110)
            .overlay(buttonOverlay)
            .shadow(color: activeButton == skill ? .black.opacity(0.5) : .clear, radius: 5, x: 0, y: 5)
            .overlay(SkillButtonText(skill: skill))
            .overlay(SkillLoading(skill: skill))
            .overlay(activeButton == skill ? Cooldown(skill: skill) : nil)
    }

    private var buttonOverlay: some View {
        RoundedRectangle(cornerRadius: 30)
            .stroke(activeButton == skill ? Color.black.opacity(0.5) : Color.clear, lineWidth: 1)
    }
}

// MARK: - SkillButtons View

struct SkillButtons: View {
    @EnvironmentObject var skillDataViewModel: SkillDataViewModel
    @Binding var activeButton: SkillData?

    var body: some View {
        VStack {
            Spacer()

            HStack(spacing: 5) {
                SkillButton(skill: skillDataViewModel.skillOne, activeButton: $activeButton)
                SkillButton(skill: skillDataViewModel.skillTwo, activeButton: $activeButton)
                SkillButton(skill: skillDataViewModel.skillThree, activeButton: $activeButton)
                SkillButton(skill: skillDataViewModel.skillFour, activeButton: $activeButton)
            }
        }
    }
}

// MARK: - SkillButtonText View

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

// MARK: - ConfirmButton View

struct ConfirmButton: View {
    @Binding var activeButton: SkillData?
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    @EnvironmentObject var skillDataViewModel: SkillDataViewModel
    
    var body: some View {
        VStack {
            Spacer()
            confirmButton
        }
    }
    
    private var confirmButton: some View {
        NavigationLink {
            BattleHedgie(activeButton: $activeButton)
        } label: {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("brown"))
                .frame(width: 110, height: 40)
                .overlay(
                    Text("Confirm")
                        .font(Font.custom("GillSans", size: 20))
                        .foregroundColor(.white)
                )
        }
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(activeButton == nil ? Color.black.opacity(0.5) : Color.clear)
        )
        .disabled(activeButton == nil)
    }
}

// MARK: - Hotbar View

struct Hotbar: View {
    @EnvironmentObject var skillDataViewModel: SkillDataViewModel
    @EnvironmentObject var characterDataViewModel: CharacterDataViewModel
    @State private var activeButton: SkillData? = nil
    
    var body: some View {
        HStack(spacing: 5) {
            SkillButtons(activeButton: $activeButton)
            ConfirmButton(activeButton: $activeButton)
        }
        .padding(.leading, 110)
    }
}

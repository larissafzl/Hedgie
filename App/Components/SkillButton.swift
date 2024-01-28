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

struct SkillButton: View {
    @ObservedObject var skill: SkillData
    @Binding var activeButton: SkillData?

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
                activeButton == skill ? Cooldown(skill: skill) : nil
            )
            .onTapGesture {
                if activeButton == skill {
                    activeButton = nil
                } else {
                    activeButton = skill
                }
            }
    }
}

struct SkillButtons: View {
    @ObservedObject var viewModel: SkillDataViewModel
    @Binding var activeButton: SkillData?

    var body: some View {
        VStack {
            Spacer()

            HStack(spacing: 5) {
                SkillButton(skill: viewModel.skillOne, activeButton: $activeButton)
                SkillButton(skill: viewModel.skillTwo, activeButton: $activeButton)
                SkillButton(skill: viewModel.skillThree, activeButton: $activeButton)
                SkillButton(skill: viewModel.skillFour, activeButton: $activeButton)
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

    var body: some View {
        VStack {
            Spacer()
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("orange"))
                .frame(width: 110, height: 40)
                .overlay(
                    Text("Confirm")
                        .font(Font.custom("GillSans", size: 20))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(activeButton == nil ? .black.opacity(0.5) : .clear)
                        .frame(width: 110, height: 40)
                )
        }
    }
}

struct Hotbar: View {
    @ObservedObject var viewModel: SkillDataViewModel
    @State private var activeButton: SkillData? = nil

    var body: some View {
        HStack(spacing: 5) {
            SkillButtons(viewModel: viewModel, activeButton: $activeButton)
            
            ConfirmButton(activeButton: $activeButton)
        }
        .padding(.leading, 110)
    }
}

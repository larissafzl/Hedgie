//
//  SkillButton.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct SkillButton: View {
    @ObservedObject var skill: SkillData
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(skill.type == .defensive ? Color("blue") : Color("red"))
            .frame(width: 110, height: 110)
            .overlay(
                SkillButtonText(skill: skill)
            )
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


struct SkillButtons: View {
    @ObservedObject var viewModel: SkillDataViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 5) {
                SkillButton(skill: viewModel.skillOne)
                SkillButton(skill: viewModel.skillTwo)
                SkillButton(skill: viewModel.skillThree)
                SkillButton(skill: viewModel.skillFour)
            }
        }
    }
}

struct ConfirmButton: View {
    var body: some View {
        VStack {
            Spacer()
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color("orange"))
                .frame(width: 110, height: 40)
        }
    }
}

struct Hotbar: View {
    @ObservedObject var viewModel: SkillDataViewModel
    
    var body: some View {
        HStack(spacing: 5) {
            SkillButtons(viewModel: viewModel)
            
            ConfirmButton()
        }
        .padding(.leading, 110)
    }
}

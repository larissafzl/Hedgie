//
//  SkillButton.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct SkillButton: View {
    var color: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color(color))
            .frame(width: 110, height: 110)
    }
}

struct SkillButtons: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack(spacing: 5) {
                SkillButton(color: "red")
                SkillButton(color: "red")
                SkillButton(color: "blue")
                SkillButton(color: "blue")
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
    var body: some View {
        HStack(spacing: 5) {
            SkillButtons()
            
            ConfirmButton()
        }
        .padding(.leading, 110)
    }
}

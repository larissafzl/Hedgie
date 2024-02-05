//
//  TextBox.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct TextBoxView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 590, height: 90)
            .foregroundColor(.white.opacity(0.7))
    }
}

// Displays dynamic text based on the provided content
struct TextView: View {
    @Binding var currentIndex: Int
    var textContent: [IntroContent.TextPart]

    var body: some View {
        // Concatenates the text content into a single Text view
        let concatenatedText = textContent.reduce(Text("")) { (result, part) in
            result + Text(part.text)
                .font(Font.custom(part.fontName, size: 20))
        }

        return concatenatedText
            .multilineTextAlignment(.center)
            .padding(.horizontal, 40)
    }
}

struct TextBoxIntroView1: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        TextBoxView()
            .overlay(
                ArrowButtonIntroView1(currentIndex: $currentIndex)
            )
            .overlay(
                TextView(currentIndex: $currentIndex, textContent: content[currentIndex].textContent)
            )
    }
}

struct TextBoxIntroView2: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        TextBoxView()
            .overlay(
                NavigationLink(destination: TutorialView1()) {
                    ArrowButtonView()
                }
            )
        
            .overlay(
                HStack {
                    Text("Otty:")
                        .font(Font.custom("GillSans", size: 20))
                        .italic()
                    
                    Text("Hey")
                        .font(Font.custom("GillSans", size: 20))
                    
                    Text("Hedgie!")
                        .font(Font.custom("GillSans", size: 20))
                        .italic()
                    
                    Text("Wanna talk?")
                        .font(Font.custom("GillSans", size: 20))
                }
            )
    }
}

struct TextBoxBattleHedgie: View {
    @Binding var activeButton: SkillData?
    
    var body: some View {
        VStack {
            Spacer()
            TextBoxView()
                .padding(.vertical, 24)
                .overlay(
                    HStack {
                        if activeButton?.type == .offensive {
                            Text("Hedgie").italic()
                            Text("used")
                            Text("\(activeButton?.skillName ?? "No Skill Selected")").italic().bold()
                            Text("and increased")
                            Text("Otty's").italic()
                            Text("Quality Time!").italic()
                        } else {
                            Text("Hedgie").italic()
                            Text("used")
                            Text("\(activeButton?.skillName ?? "No Skill Selected")").italic().bold()
                            Text("and restored his")
                            Text("Social Energy!").italic()
                        }
                    }
                    .font(Font.custom("GillSans", size: 20))
                )
        }
    }
}

struct TextBoxBattleEnemy: View {
    let skillName: String
    
    var body: some View {
        VStack {
            Spacer()
            TextBoxView()
                .padding(.vertical, 24)
                .overlay(
                    VStack {
                        HStack {
                            Text("Otty").italic()
                            Text("used")
                            Text(skillName).italic().bold().font(Font.custom("GillSans", size: 20))
                            Text("and lowered")
                        }
                        HStack {
                            Text("Hedgie's").italic()
                            Text("Social Energy!").italic()
                        }
                    }
                    .font(Font.custom("GillSans", size: 20))
                )
        }
    }
}

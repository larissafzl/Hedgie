//
//  VictoryView.swift
//
//
//  Created by Larissa Fazolin on 31/01/24.
//

import SwiftUI

struct VictoryView: View {
    var body: some View {
        ZStack {
            LightBackground()
            
            VStack(spacing: 32) {
                Spacer()
                
                HStack(spacing: 32) {
                    CharacterImage(imageName: "happyHedge")
                    
                    VictoryBalloon()
                    
                    CharacterImage(imageName: "superHappyOtter")
                }
                
                TextBoxView()
                    .overlay(
                        HStack {
                            Text("Otty, the friendly friend,").italic()
                            Text("had a great quality time with")
                            Text("Hedgie!").italic()
                        }
                        .font(Font.custom("GillSans", size: 20))
                    )
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

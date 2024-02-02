//
//  IntroView2.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct IntroView2: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        ZStack {
            RainyBackground()
            
            VStack(spacing: 32) {
                Spacer()
                
                HStack(spacing: 32) {
                    CharacterImage(imageName: "shockedHedge")
                    
                    BattleBalloon()
                    
                    CharacterImage(imageName: "hiOtter")
                }
                
                TextBoxIntroView2(currentIndex: $currentIndex)
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

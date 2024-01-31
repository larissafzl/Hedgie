//
//  DefeatView.swift
//
//
//  Created by Larissa Fazolin on 31/01/24.
//

import SwiftUI

struct DefeatView: View {
    var body: some View {
        ZStack {
            Background()
            
            VStack(spacing: 32) {
                Spacer()
                
                HStack(spacing: 32) {
                    CharacterImage(imageName: "sadHedge")
                    
                    DefeatBalloon()
                    
                    CharacterImage(imageName: "hiOtter")
                }
                
                TextBoxView()
                    .overlay(
                        VStack {
                            HStack {
                                Text("Hedgie's").italic()
                                Text("social energy was drained and he needed to go...")
                            }
                            HStack {
                                Text("But that's okay,")
                                Text("Otty").italic()
                                Text("understands.")
                            }
                        }
                        .font(Font.custom("GillSans", size: 20))
                    )
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

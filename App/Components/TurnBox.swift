//
//  SwiftUIView.swift
//  
//
//  Created by Larissa Fazolin on 26/01/24.
//

import SwiftUI

struct TurnBoxHedgie: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(width: 140, height: 40)
                    .padding(.vertical, 16)
                    .overlay(
                        Text("Your Turn")
                            .font(Font.custom("GillSans", size: 20))
                    )
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct TurnBoxEnemy: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(width: 170, height: 40)
                    .padding(.vertical, 16)
                    .overlay(
                        Text("Opponent's Turn")
                            .font(Font.custom("GillSans", size: 20))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .foregroundColor(.black.opacity(0.5))
                            .frame(width: 170, height: 40)
                    )
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

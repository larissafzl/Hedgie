//
//  SwiftUIView.swift
//  
//
//  Created by Larissa Fazolin on 26/01/24.
//

import SwiftUI

// MARK: - TurnBoxHedgie View

struct TurnBoxHedgie: View {
    var body: some View {
        VStack {
            HStack {
                yourTurnBox
                Spacer()
            }
            Spacer()
        }
    }

    private var yourTurnBox: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(.white.opacity(0.7))
            .frame(width: 140, height: 40)
            .padding(.vertical, 16)
            .overlay(
                Text("Your Turn")
                    .font(Font.custom("GillSans", size: 20))
            )
    }
}

// MARK: - TurnBoxEnemy View

struct TurnBoxEnemy: View {
    var body: some View {
        VStack {
            HStack {
                opponentTurnBox
                Spacer()
            }
            Spacer()
        }
    }

    private var opponentTurnBox: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.white.opacity(0.7))
                .frame(width: 170, height: 40)
                .padding(.vertical, 16)
                .overlay(
                    Text("Opponent's Turn")
                        .font(Font.custom("GillSans", size: 20))
                )
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.black.opacity(0.5))
                .frame(width: 170, height: 40)
        }
    }
}

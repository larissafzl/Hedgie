//
//  BattleEndView.swift
//  
//
//  Created by Larissa Fazolin on 02/02/24.
//

import SwiftUI

// MARK: - VictoryView

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
                        VStack {
                            HStack {
                                Text("Hedgie").italic()
                                Text("tried his best and")
                                Text("Otty, the friendly friend,").italic()
                            }
                            HStack {
                                Text("had a great quality time with him!")
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

// MARK: - DefeatView

struct DefeatView: View {
    var body: some View {
        ZStack {
            LightBackground()

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
                                Text("social energy was drained and he needed to go.")
                            }
                            HStack {
                                Text("But that's okay.")
                                Text("Otty, the friendly friend,").italic()
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

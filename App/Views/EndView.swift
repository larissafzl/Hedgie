//
//  EndView.swift
//
//
//  Created by Larissa Fazolin on 06/02/24.
//

import SwiftUI

struct CreditsView: View {
    @State private var showInitialMenu = false
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        Group {
            if showInitialMenu {
                InitialMenu(initialIndex: 0)
            } else {
                ZStack {
                    InitialMenuBackground()
                    
                    VStack(spacing: -80) {
                        GameTitle()
                            .padding(.bottom)
                        
                        Image("balloon")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 235, height: 80)
                            .overlay(
                                VStack {
                                    Text("Created by").italic()
                                    Text("Larissa Fazolin")
                                }
                                .font(Font.custom("GillSans", size: 20))
                            )
                    }
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                            withAnimation {
                                self.showInitialMenu = true
                            }
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct EndView1: View {
    var body: some View {
        ZStack {
            InitialMenuBackground()
            
            BlackBackground()
            
            BrownRectangle()
                .overlay(
                    VStack(spacing: 16) {
                        Spacer()
                        
                        TutorialViewTitle(titleCalled: "thankYou")
                        
                        Text("The Hedgehog's Dilemma is a metaphor that describes the challenge of balancing intimacy and distance in relationships. On a winter's day, the hedgehogs will suffer from the cold if they're too far apart, but they'll poke each other with their spines if they get too close.")
                            .font(Font.custom("GillSans", size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            .padding(.vertical)
                        
                        Spacer()
                    }
                )
                .overlay(
                    TutorialIndex(currentIndex: "1/2")
                )
                .overlay(
                    NavigationLink(destination: {
                        EndView2()
                    }, label: {
                        TutorialArrow()
                    })
                )
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct EndView2: View {
    var body: some View {
        ZStack {
            InitialMenuBackground()
            
            BlackBackground()
            
            BrownRectangle()
                .overlay(
                    VStack(spacing: 16) {
                        Spacer()
                        
                        Text("Hedgie's social anxiety is a representation of this dilemma. Every human being wants connection, but that can be harder for some who struggle with mental disorders. \n\n This game is about finding the right balance between closeness and maintaining personal boundaries to avoid hurting each other.")
                            .font(Font.custom("GillSans", size: 20))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            .padding(.vertical)
                        
                        Spacer()
                    }
                )
                .overlay(
                    TutorialIndex(currentIndex: "2/2")
                )
                .overlay(
                    NavigationLink(destination: {
                        CreditsView()
                    }, label: {
                        TutorialArrow()
                    })
                )
        }
        .navigationBarBackButtonHidden(true)
    }
}

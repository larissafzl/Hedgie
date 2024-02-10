//
//  EndView.swift
//
//
//  Created by Larissa Fazolin on 06/02/24.
//

import SwiftUI

struct CreditsView: View {
    @State private var scrollOffset: CGFloat = 300
    @State private var navigateToInitialMenu = false
    @State private var showNavigationLink = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color("brown"))
            
            GeometryReader { geometry in
                ScrollView {
                    VStack(spacing: 80) {
                        VStack(spacing: 24) {
                            Image("lineCredits")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180)
                            
                            Image("theHedgehogsDilemmaCredits")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 500)
                                .padding(.bottom, 24)
                            
                            Text("The Hedgehog's Dilemma is a metaphor that describes the challenge of balancing intimacy and distance in relationships. On a winter's day, the hedgehogs will suffer from the cold if they're too far apart, but they'll poke each other with their spines if they get too close.")
                                .font(Font.custom("GillSans", size: 20))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text("Hedgie's social anxiety is a representation of this dilemma. Every human being wants connection, but that can be harder for some who struggle with mental disorders. \n\n This game is about finding the right balance between closeness and maintaining personal boundaries to avoid hurting each other.")
                                .font(Font.custom("GillSans", size: 20))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            Text("Thank you for playing!")
                                .font(Font.custom("GillSans", size: 20)).italic()
                                .foregroundColor(.white)
                        }
                        
                        VStack(spacing: 24) {
                            Image("lineCredits")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180)
                            
                            Image("createdBy")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 230)
                                .padding(.bottom, 24)
                            
                            Text("Larissa Fazolin")
                                .font(Font.custom("GillSans", size: 20))
                                .foregroundColor(.white)
                        }
                        .padding(.bottom, 1000)
                    }
                    .padding(.horizontal, (geometry.size.width - 500) / 2)
                    .offset(y: scrollOffset)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 50)) {
                            scrollOffset = -800
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 45) {
                            navigateToInitialMenu = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                            showNavigationLink = true
                        }
                    }
                }
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    if showNavigationLink {
                        NavigationLink {
                            InitialMenu(initialIndex: 0)
                        } label: {
                            Text("Skip")
                                .font(Font.custom("GillSans", size: 20))
                                .foregroundColor(.white)
                                .underline()
                                .padding(.bottom)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(
            NavigationLink("", destination: InitialMenu(initialIndex: 0), isActive: $navigateToInitialMenu)
                .hidden()
        )
    }
}

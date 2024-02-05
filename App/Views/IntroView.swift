//
//  IntroView.swift
//  
//
//  Created by Larissa Fazolin on 02/02/24.
//

import SwiftUI

class IntroState: ObservableObject {
    @Published var currentIndex: Int = 0
}

// MARK: - FirstIntroPart

struct FirstIntroPart: View {
    @Binding var currentIndex: Int
    
    init(currentIndex: Binding<Int>) {
        _currentIndex = currentIndex
        UINavigationBar.setAnimationsEnabled(false)
    }

    var body: some View {
        ZStack {
            LightBackground()
            ContentView(currentIndex: $currentIndex)
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct ContentView: View {
    @Binding var currentIndex: Int

    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            GetCharacterImage(currentIndex: $currentIndex, imageName: content[currentIndex].imageName)
            TextBoxIntroView1(currentIndex: $currentIndex)
            Spacer()
        }
    }
}

// MARK: - SecondIntroPart

struct SecondIntroPart: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        ZStack {
            RainyBackground()
            SecondContentView(currentIndex: $currentIndex)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SecondContentView: View {
    @Binding var currentIndex: Int

    var body: some View {
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
}

// MARK: - HedgiesIntro

struct HedgiesIntro: View {
    @Binding var currentIndex: Int
    @State private var isActive: Bool = false
    @State private var shake = false
    
    var body: some View {
        ZStack {
            RainyBackground()
            
            Image("shockedHedge")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .rotationEffect(Angle(degrees: shake ? 0 : 0))
                .onAppear() {
                    withAnimation(Animation.easeInOut(duration: 0.05).repeatForever(autoreverses: true)) {
                        self.shake.toggle()
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        currentIndex = (currentIndex + 1) % content.count
                        isActive = true
                    }
                    
                }
                .navigationBarBackButtonHidden(true)
                .background(
                    NavigationLink(
                        destination: FirstIntroPart(currentIndex: $currentIndex),
                        isActive: $isActive
                    ) {
                        EmptyView()
                    }
                        .hidden()
                )
        }
    }
}

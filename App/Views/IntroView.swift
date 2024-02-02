//
//  IntroView.swift
//  
//
//  Created by Larissa Fazolin on 02/02/24.
//

import SwiftUI

// MARK: - IntroView1

struct IntroView1: View {
    @State private var currentIndex = 0
    
    init() {
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

// MARK: - IntroView2

struct IntroView2: View {
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

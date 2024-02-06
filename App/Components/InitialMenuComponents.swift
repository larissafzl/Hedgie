//
//  InitialMenuComponents.swift
//
//
//  Created by Larissa Fazolin on 01/02/24.
//

import SwiftUI

// MARK: - InitialMenuComponents View

struct InitialMenuComponents: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack {
            GameTitle()
                .padding(.bottom, -60)
            StartButtonLink(currentIndex: $currentIndex)
                .padding(.top, -10)
            AboutButton()
                .padding(.top, -20)
        }
        .padding(.bottom)
    }
}

// MARK: - GameTitle View

struct GameTitle: View {
    var body: some View {
        Image("theHedgehogsDilemma")
            .resizable()
            .scaledToFill()
            .frame(width: 540, height: 300)
            .padding(.bottom, 40)
    }
}

// MARK: - StartButtonLink View

struct StartButtonLink: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        NavigationLink {
            FirstIntroPart(currentIndex: $currentIndex)
        } label: {
            StartButton()
        }
    }
}

// MARK: - StartButton View

struct StartButton: View {
    var body: some View {
        Text("Start")
            .foregroundColor(.white)
            .font(Font.custom("GillSans", size: 28))
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color("brown"))
                    .frame(width: 140, height: 60)
            )
            .padding(.bottom, 40)
    }
}

// MARK: - AboutButton View

struct AboutButton: View {
    var body: some View {
        Text("About")
            .foregroundColor(.white)
            .font(Font.custom("GillSans", size: 20))
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color("brown"))
                    .opacity(0.8)
                    .frame(width: 90, height: 40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("brown"), lineWidth: 2) // Adjust the color and lineWidth as needed
                    )
            )
    }
}

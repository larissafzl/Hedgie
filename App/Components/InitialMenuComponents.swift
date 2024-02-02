//
//  InitialMenuComponents.swift
//
//
//  Created by Larissa Fazolin on 01/02/24.
//

import SwiftUI

// MARK: - InitialMenuComponents View

struct InitialMenuComponents: View {
    var body: some View {
        VStack {
            GameTitle()
            StartButtonLink()
            AboutButton()
        }
    }
}

// MARK: - GameTitle View

struct GameTitle: View {
    var body: some View {
        Image("theHedgehogsDilemma")
            .resizable()
            .scaledToFill()
            .frame(width: 490, height: 250)
    }
}

// MARK: - StartButtonLink View

struct StartButtonLink: View {
    var body: some View {
        NavigationLink {
            FirstIntroPart()
        } label: {
            StartButton()
        }
    }
}

// MARK: - StartButton View

struct StartButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color("brown"))
            .frame(width: 130, height: 40)
            .overlay(
                Text("Start")
                    .foregroundColor(.white)
                    .font(Font.custom("GillSans", size: 20))
            )
    }
}

// MARK: - AboutButton View

struct AboutButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .foregroundColor(Color("brown"))
            .frame(width: 100, height: 30)
            .overlay(
                Text("About")
                    .foregroundColor(.white)
                    .font(Font.custom("GillSans", size: 16))
            )
    }
}

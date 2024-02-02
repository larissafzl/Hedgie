//
//  Background.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct LightBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Image("lightBackground")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct DarkBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Image("darkBackground")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct RainyBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Image("rainyBackground")
                .resizable()
                .scaledToFill()
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

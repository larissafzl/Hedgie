//
//  ArrowButton.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct ArrowButton: View {
    var body: some View {
        Image(systemName: "triangleshape.fill")
            .rotationEffect(.degrees(90))
            .foregroundColor(Color("orange"))
            .padding()
    }
}

struct ArrowButtonView: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                ArrowButton()
            }
        }
    }
}

// Contains the logic for the ArrowButton
struct ArrowButtonIntroView1: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        // Check if the current index is at the last content item
        if currentIndex == content.count - 1 {
            NavigationLink(destination: IntroView2(currentIndex: $currentIndex)) {
                ArrowButtonView()
            }
        } else {
            ArrowButtonView()
                .onTapGesture {
                    currentIndex = (currentIndex + 1) % content.count
                }
        }
    }
}

//
//  ArrowButton.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct ArrowButtonView: View {
    var body: some View {
        Image(systemName: "triangleshape.fill")
            .rotationEffect(.degrees(90))
            .foregroundColor(Color("orange"))
            .padding()
    }
}

// Contains the logic for the ArrowButton
struct ArrowButton: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                // Check if the current index is at the last content item
                if currentIndex == content.count - 1 {
                    NavigationLink(destination: IntroView2(currentIndex: $currentIndex)) {
                        ArrowButtonView()
                    }
                } else {
                    Button(action: {
                        currentIndex = (currentIndex + 1) % content.count
                    }) {
                        ArrowButtonView()
                    }
                }
            }
        }
    }
}

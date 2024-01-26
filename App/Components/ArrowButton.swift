//
//  SwiftUIView.swift
//  
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct ArrowButton: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                
                if currentIndex == content.count - 1 {
                    NavigationLink(destination: IntroView2(currentIndex: $currentIndex)) {
                        Image(systemName: "triangleshape.fill")
                            .rotationEffect(.degrees(90))
                            .foregroundColor(Color("orange"))
                            .padding()
                    }
                } else {
                    Button(action: {
                        currentIndex = (currentIndex + 1) % content.count
                    }) {
                        Image(systemName: "triangleshape.fill")
                            .rotationEffect(.degrees(90))
                            .foregroundColor(Color("orange"))
                            .padding()
                    }
                }
            }
        }
    }
}

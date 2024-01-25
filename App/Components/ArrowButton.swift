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
        VStack() {
            Spacer()
            HStack {
                Spacer()
                
                Button(action: {
                    currentIndex = (currentIndex + 1) % content.count
                }, label: {
                    Image(systemName: "triangleshape.fill")
                        .rotationEffect(.degrees(90))
                        .foregroundColor(Color("orange"))
                        .padding()
                })
            }
        }
    }
}

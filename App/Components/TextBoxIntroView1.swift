//
//  SwiftUIView.swift
//  
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct TextBoxIntroView1: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 590, height: 90)
            .foregroundColor(.white.opacity(0.7))
        
            .overlay(
                ArrowButton(currentIndex: $currentIndex)
            )
        
            .overlay(
                TextView(currentIndex: $currentIndex, textContent: content[currentIndex].textContent)
            )
    }
}

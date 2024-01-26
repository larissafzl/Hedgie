//
//  SwiftUIView.swift
//  
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct TextBoxIntroView2: View {
    @Binding var currentIndex: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 590, height: 90)
            .foregroundColor(.white.opacity(0.7))
        
            .overlay(
                ArrowButton(currentIndex: $currentIndex)
            )
        
            .overlay(
                HStack {
                    Text("Otty:")
                        .font(Font.custom("GillSans", size: 20))
                        .italic()
                    
                    Text("Hey")
                        .font(Font.custom("GillSans", size: 20))
                    
                    Text("Hedgie!")
                        .font(Font.custom("GillSans", size: 20))
                        .italic()
                    
                    Text("Wanna talk?")
                        .font(Font.custom("GillSans", size: 20))
                }
            )
    }
}

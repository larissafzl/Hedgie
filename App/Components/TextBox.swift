//
//  SwiftUIView.swift
//  
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct TextBox: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .frame(width: 590, height: 90)
            .foregroundColor(.white.opacity(0.7))
            .overlay(
                VStack() {
                    Spacer()
                    HStack {
                        Spacer()
                        ArrowButton()
                    }
                }
            )
    }
}

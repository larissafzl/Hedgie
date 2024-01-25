//
//  SwiftUIView.swift
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

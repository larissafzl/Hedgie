//
//  CharacterImage.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct CharacterImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 210, height: 195)
    }
}

// Gets and displays character images based on the current index
struct GetCharacterImage: View {
    @Binding var currentIndex: Int
    var imageName: String
    
    var body: some View {
        Image(content[currentIndex].imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 210, height: 195)
    }
}

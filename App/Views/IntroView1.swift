//
//  IntroView1.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct IntroView1: View {
    @State var currentIndex = 0
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }

    var body: some View {
        ZStack {
            Background()
            
            VStack(spacing: 32) {
                Spacer()
                
                GetCharacterImage(currentIndex: $currentIndex, imageName: content[currentIndex].imageName)
                
                TextBoxIntroView1(currentIndex: $currentIndex)
                
                Spacer()
            }
        }
    }
}

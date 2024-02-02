//
//  InitialMenu.swift
//
//
//  Created by Larissa Fazolin on 01/02/24.
//

import SwiftUI

struct InitialMenu: View {
    
    init() {
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some View {
        ZStack {
            InitialMenuBackground()
            
            InitialMenuComponents()
            
            CharactersImage()
        }
    }
}

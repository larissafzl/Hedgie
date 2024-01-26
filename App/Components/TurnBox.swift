//
//  SwiftUIView.swift
//  
//
//  Created by Larissa Fazolin on 26/01/24.
//

import SwiftUI

struct TurnBox: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(.white.opacity(0.7))
                    .frame(width: 140, height: 40)
                    .padding(.vertical, 16)
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct TextView: View {
    @Binding var currentIndex: Int
    var textContent: [ContentIntroView1.TextPart]

    var body: some View {
        let concatenatedText = textContent.reduce(Text("")) { (result, part) in
            result + Text(part.text)
                .font(Font.custom(part.fontName, size: 20))
        }

        return concatenatedText
            .multilineTextAlignment(.center)
            .padding(.horizontal, 40)
    }
}

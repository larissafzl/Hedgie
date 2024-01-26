//
//  StatsBalloon.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct StatsBalloonLeft: View {
    var body: some View {
        Image("balloonLeft")
            .resizable()
            .scaledToFit()
            .frame(width: 195, height: 110)
            .padding(.leading, 300)
            .padding(.bottom, 200)
    }
}

struct StatsBalloonRight: View {
    var body: some View {
        Image("balloonRight")
            .resizable()
            .scaledToFit()
            .frame(width: 195, height: 110)
            .padding(.trailing, 300)
            .padding(.bottom, 150)
    }
}

//
//  Balloons.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct BattleBalloon: View {
    var body: some View {
        Image("battleBalloon")
            .resizable()
            .scaledToFill()
            .frame(width: 210, height: 195)
    }
}

struct VictoryBalloon: View {
    var body: some View {
        Image("victoryBalloon")
            .resizable()
            .scaledToFill()
            .frame(width: 210, height: 195)
    }
}

struct DefeatBalloon: View {
    var body: some View {
        Image("defeatBalloon")
            .resizable()
            .scaledToFill()
            .frame(width: 210, height: 195)
    }
}

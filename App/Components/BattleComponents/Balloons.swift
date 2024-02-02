//
//  Balloons.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

// MARK: - BattleBalloon View

struct BattleBalloon: View {
    var body: some View {
        BalloonImage(imageName: "battleBalloon")
    }
}

// MARK: - VictoryBalloon View

struct VictoryBalloon: View {
    var body: some View {
        BalloonImage(imageName: "victoryBalloon")
    }
}

// MARK: - DefeatBalloon View

struct DefeatBalloon: View {
    var body: some View {
        BalloonImage(imageName: "defeatBalloon")
    }
}

// MARK: - BalloonImage View

struct BalloonImage: View {
    let imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 210, height: 195)
    }
}

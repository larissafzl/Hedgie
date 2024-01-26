//
//  BattleView.swift
//
//
//  Created by Larissa Fazolin on 25/01/24.
//

import SwiftUI

struct BattleView: View {
    var body: some View {
        ZStack {
            Background()
            
            TurnBox()
            
            HedgieBattleView()
            
            EnemyBattleView(imageName: "otter")
            
            Hotbar()
        }
    }
}

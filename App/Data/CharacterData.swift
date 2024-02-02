//
//  CharacterData.swift
//
//
//  Created by Larissa Fazolin on 26/01/24.
//

import SwiftUI

// MARK: - LifeType Enum

enum LifeType {
    case socialEnergy
    case qualityTime
}

// MARK: - CharacterData Class

class CharacterData: ObservableObject {
    @Published var name: String
    @Published var lifeType: LifeType
    @Published var totalLife: Double
    @Published var currentLife: Double

    init(name: String, lifeType: LifeType, totalLife: Int, currentLife: Int) {
        self.name = name
        self.lifeType = lifeType
        self.totalLife = Double(totalLife)
        self.currentLife = Double(currentLife)
    }
}

// MARK: - CharacterDataViewModel Class

class CharacterDataViewModel: ObservableObject {
    @Published var hedgie: CharacterData
    @Published var otty: CharacterData

    init() {
        self.hedgie = CharacterData(name: "Hedgie", lifeType: .socialEnergy, totalLife: 35, currentLife: 35)
        self.otty = CharacterData(name: "Otty", lifeType: .qualityTime, totalLife: 50, currentLife: 0)
    }
}

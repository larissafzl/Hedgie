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
    @Published var animatedProgressValue: Double // New property for animated progress value

    init(name: String, lifeType: LifeType, totalLife: Int, currentLife: Int, animatedProgressValue: Int) {
        self.name = name
        self.lifeType = lifeType
        self.totalLife = Double(totalLife)
        self.currentLife = Double(currentLife)
        self.animatedProgressValue = Double(animatedProgressValue)
    }
}

// MARK: - CharacterDataViewModel Class

class CharacterDataViewModel: ObservableObject {
    @Published var hedgie: CharacterData
    @Published var otty: CharacterData

    init() {
        self.hedgie = CharacterData(name: "Hedgie", lifeType: .socialEnergy, totalLife: 40, currentLife: 40, animatedProgressValue: 1)
        self.otty = CharacterData(name: "Otty", lifeType: .qualityTime, totalLife: 80, currentLife: 0, animatedProgressValue: 0)
    }
    
    func resetCharacterData() {
        hedgie = CharacterData(name: "Hedgie", lifeType: .socialEnergy, totalLife: 40, currentLife: 40, animatedProgressValue: 1)
        otty = CharacterData(name: "Otty", lifeType: .qualityTime, totalLife: 80, currentLife: 0, animatedProgressValue: 0)
    }
}

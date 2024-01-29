//
//  SkillData.swift
//
//
//  Created by Larissa Fazolin on 26/01/24.
//

import SwiftUI

enum SkillType {
    case offensive
    case defensive
}

class SkillData: ObservableObject, Equatable {
    static func == (lhs: SkillData, rhs: SkillData) -> Bool {
        return lhs.skillName == rhs.skillName
            && lhs.description == rhs.description
            && lhs.type == rhs.type
            && lhs.strength == rhs.strength
            && lhs.cooldown == rhs.cooldown
    }

    @Published var skillName: String
    @Published var description: String
    @Published var type: SkillType
    @Published var strength: Double
    @Published var cooldown: Double

    init(skillName: String, description: String, type: SkillType, strength: Double, cooldown: Double) {
        self.skillName = skillName
        self.description = description
        self.type = type
        self.strength = strength
        self.cooldown = cooldown
    }
}

class SkillDataViewModel: ObservableObject {
    @Published var skillOne: SkillData
    @Published var skillTwo: SkillData
    @Published var skillThree: SkillData
    @Published var skillFour: SkillData

    init() {
        self.skillOne = SkillData(skillName: "Just Smile", description: "Quality Time", type: .offensive, strength: 15.0, cooldown: 1)
        self.skillTwo = SkillData(skillName: "Ask a Question", description: "Quality Time", type: .offensive, strength: 30.0, cooldown: 2)
        self.skillThree = SkillData(skillName: "Stay Silent", description: "Social Energy", type: .defensive, strength: 15.0, cooldown: 3)
        self.skillFour = SkillData(skillName: "Nod Head", description: "Protect yourself for 1 turn", type: .defensive, strength: 0, cooldown: 2)
    }
}

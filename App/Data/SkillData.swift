//
//  SkillData.swift
//
//
//  Created by Larissa Fazolin on 26/01/24.
//

import SwiftUI

// MARK: - SkillType Enum

enum SkillType {
    case offensive
    case defensive
}

// MARK: - SkillData Class

class SkillData: ObservableObject, Equatable, Hashable {
    static func == (lhs: SkillData, rhs: SkillData) -> Bool {
        return lhs.skillName == rhs.skillName
            && lhs.description == rhs.description
            && lhs.type == rhs.type
            && lhs.strength == rhs.strength
            && lhs.cooldown == rhs.cooldown
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(skillName)
        hasher.combine(description)
        hasher.combine(type)
        hasher.combine(strength)
        hasher.combine(cooldown)
    }

    func decreaseCooldown() {
        if remainingCooldown > 0 {
            remainingCooldown -= 1
        }
    }

    func resetCooldown() {
        remainingCooldown = cooldown + 1
    }

    @Published var skillName: String
    @Published var description: String
    @Published var type: SkillType
    @Published var strength: Double
    @Published var cooldown: Double
    @Published var isActivated: Bool = false
    @Published var remainingCooldown: Double

    init(skillName: String, description: String, type: SkillType, strength: Double, cooldown: Double, remainingCooldown: Double) {
        self.skillName = skillName
        self.description = description
        self.type = type
        self.strength = strength
        self.cooldown = cooldown
        self.remainingCooldown = remainingCooldown
    }
}

// MARK: - SkillDataViewModel Class

class SkillDataViewModel: ObservableObject {
    @Published var skillOne: SkillData
    @Published var skillTwo: SkillData
    @Published var skillThree: SkillData
    @Published var skillFour: SkillData

    @Published var confirmedSkills: [SkillData: Bool] = [:]

    func decreaseCooldowns() {
        for (skill, confirmed) in confirmedSkills {
            if confirmed {
                skill.remainingCooldown -= 1

                // Check if the remaining cooldown is 0, then remove from confirmed skills
                if skill.remainingCooldown == 0 {
                    confirmedSkills[skill] = false
                    skill.resetCooldown()
                }
            }
        }
    }

    func resetSkillsData() {
        self.skillOne = SkillData(skillName: "Just Smile", description: "Quality Time", type: .offensive, strength: 15.0, cooldown: 1, remainingCooldown: 2)
        self.skillTwo = SkillData(skillName: "Ask a Question", description: "Quality Time", type: .offensive, strength: 25.0, cooldown: 2, remainingCooldown: 3)
        self.skillThree = SkillData(skillName: "Stay Silent", description: "Social Energy", type: .defensive, strength: 10, cooldown: 2, remainingCooldown: 3)
        self.skillFour = SkillData(skillName: "Nod Head", description: "Social Energy", type: .defensive, strength: 15.0, cooldown: 3, remainingCooldown: 4)
        self.confirmedSkills = [:]
    }

    init() {
        self.skillOne = SkillData(skillName: "Just Smile", description: "Quality Time", type: .offensive, strength: 15.0, cooldown: 1, remainingCooldown: 2)
        self.skillTwo = SkillData(skillName: "Ask a Question", description: "Quality Time", type: .offensive, strength: 25.0, cooldown: 2, remainingCooldown: 3)
        self.skillThree = SkillData(skillName: "Stay Silent", description: "Social Energy", type: .defensive, strength: 10, cooldown: 2, remainingCooldown: 3)
        self.skillFour = SkillData(skillName: "Nod Head", description: "Social Energy", type: .defensive, strength: 15.0, cooldown: 3, remainingCooldown: 4)
    }
}


// MARK: - OttySkillData Class

class OttySkillData: ObservableObject {
    @Published var skillOne: SkillData
    @Published var skillTwo: SkillData
    @Published var skillThree: SkillData
    @Published var skillFour: SkillData
    @Published var skillFive: SkillData
    @Published var skillSix: SkillData
    @Published var skillSeven: SkillData
    @Published var skillEight: SkillData

    init() {
        self.skillOne = SkillData(skillName: "Tell a Joke", description: "Social Energy", type: .defensive, strength: 10, cooldown: 1, remainingCooldown: 2)
        self.skillTwo = SkillData(skillName: "Gossip", description: "Social Energy", type: .defensive, strength: 10, cooldown: 2, remainingCooldown: 3)
        self.skillThree = SkillData(skillName: "Vent", description: "Social Energy", type: .defensive, strength: 10, cooldown: 3, remainingCooldown: 4)
        self.skillFour = SkillData(skillName: "Invite You to Hang Out", description: "Social Energy", type: .defensive, strength: 15, cooldown: 2, remainingCooldown: 3)
        self.skillFive = SkillData(skillName: "Compliment You", description: "Social Energy", type: .defensive, strength: 10, cooldown: 2, remainingCooldown: 3)
        self.skillSix = SkillData(skillName: "Laugh Out Loud", description: "Social Energy", type: .defensive, strength: 10, cooldown: 2, remainingCooldown: 3)
        self.skillSeven = SkillData(skillName: "Ask Your Opinion", description: "Social Energy", type: .defensive, strength: 15, cooldown: 2, remainingCooldown: 3)
        self.skillEight = SkillData(skillName: "Chatter", description: "Social Energy", type: .defensive, strength: 10, cooldown: 2, remainingCooldown: 3)
    }
}

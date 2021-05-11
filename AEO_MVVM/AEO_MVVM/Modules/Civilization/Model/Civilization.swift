//
//  Civilization.swift
//  AEO_MVVM
//
//  Created by Adrián Bolaños Ríos on 11/05/2021.
//

import Foundation

struct CivilizationList: Codable {
    let civilizations: [Civilization]
}

struct Civilization: Codable {
    let idCiv: Int
    let name: String?
    let expansion: String?
    let armyType: String?
    let teamBonus: String?
    let civilizationBonus: [String]?
    
    enum CodingKeys: String, CodingKey {
        case idCiv = "id"
        case name
        case expansion
        case armyType = "army_type"
        case teamBonus = "team_bonus"
        case civilizationBonus = "civilization_bonus"
    }
}

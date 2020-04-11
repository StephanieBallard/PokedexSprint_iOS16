//
//  Pokemon.swift
//  PokeDexSprint_iOS16
//
//  Created by Stephanie Ballard on 4/10/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

// MARK: - Pokemon
struct Pokemon: Codable {
    let abilities: [Ability]
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [TypeElement]
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species
}

// MARK: - Species
struct Species: Codable {
    let name: String
}

// MARK: - Sprites
struct Sprites: Codable {
    let front_default: String
}

// MARK: - TypeElement
struct TypeElement: Codable {
    let type: Species
}

//
//  Pokemon.swift
//  PokeDexSprint_iOS16
//
//  Created by Stephanie Ballard on 4/10/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

// MARK: - Pokedex
struct Pokedex {
    let abilities: [Ability]
    let id: Int
    let name: String
    let species: Species
    let sprites: Sprites
    let types: [TypeElement]
}

// MARK: - Ability
struct Ability {
    let ability: Species
    let isHidden: Bool
    let slot: Int
}

// MARK: - Species
struct Species {
    let name: String
    let url: String
}

// MARK: - Sprites
struct Sprites {
    let backDefault: String
    let backFemale: NSNull
    let backShiny: String
    let backShinyFemale: NSNull
    let frontDefault: String
    let frontFemale: NSNull
    let frontShiny: String
    let frontShinyFemale: NSNull
}

// MARK: - TypeElement
struct TypeElement {
    let slot: Int
    let type: Species
}

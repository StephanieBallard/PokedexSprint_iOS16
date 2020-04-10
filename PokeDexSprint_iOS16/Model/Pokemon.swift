//
//  Pokemon.swift
//  PokeDexSprint_iOS16
//
//  Created by Stephanie Ballard on 4/10/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let id: Int
    let sprite: Sprite
    let types: [Types]
    let abilities: [Ability]
    
}

struct Sprite: Codable {
    
}

struct Types: Codable {
    
}

struct Ability: Codable {
    
}

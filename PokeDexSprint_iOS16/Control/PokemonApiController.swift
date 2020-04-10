//
//  PokemonApiController.swift
//  PokeDexSprint_iOS16
//
//  Created by Stephanie Ballard on 4/10/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

class PokemonApiController {
    
    enum HTTPMethod: String {
        case get = "GET"
    }
    
    var pokemon: [Pokemon] = []
    
    private let baseURL = URL(string: "https://pokeapi.co")
    private var task: URLSessionTask?
    
    func performSearch(() -> Void) {
        
    }
}

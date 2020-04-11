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
    
    enum NetworkError: Error {
        case badUrl
        case noAuth
        case badAuth
        case otherError
        case badData
        case noDecode
        case badImage
        case failedFetch
    }
    
    var pokedex: [Pokemon] = []
    
    private let baseURL = URL(string: "https://pokeapi.co/api/v2/pokemon/")!
    
    private lazy var jsonDecoder = JSONDecoder()
    
    func getPokemon(searchTerm: String, completion: @escaping (Result<Pokemon, NetworkError>) -> Void) {
        let requestURL = baseURL.appendingPathComponent(searchTerm.lowercased())
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        print(requestURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Failed to fetch pokedex with error \(error.localizedDescription)")
                    completion(.failure(.failedFetch))
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                    response.statusCode == 200
                    else {
                        print("Fetch pokedex received bad response")
                        completion(.failure(.failedFetch))
                        return
                }
                
                guard let data = data else {
                    return completion(.failure(.badData))
                }
                
                do {
                    let pokemon = try self.jsonDecoder.decode(Pokemon.self, from: data)
                    completion(.success(pokemon))
                } catch {
                    print("Error decoding animal names: \(error.localizedDescription)")
                    completion(.failure(.badData))
                }
            }.resume()
    }
    
    func savePokemon(pokemon: Pokemon) {
        pokedex.append(pokemon)
    }
}

//
//  PokemonDetailViewController.swift
//  PokeDexSprint_iOS16
//
//  Created by Stephanie Ballard on 4/10/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokemonApiController: PokemonApiController?
    var pokemon: Pokemon?
    
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonNameTextLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonIdTextLabel: UILabel!
    @IBOutlet weak var pokemonTypesTextLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func savePokemonButtonTapped(_ sender: UIButton) {
        guard let pokemon = pokemon else { return }
        pokemonApiController?.savePokemon(pokemon: pokemon)
        navigationController?.popToRootViewController(animated: true)
        
    }
    
    private func updateViews() {
        if let pokemon = pokemon {
            pokemonNameTextLabel.text = pokemon.name
            var abilitiesText = ""
            for ability in pokemon.abilities {
                abilitiesText += "\(ability.ability.name) "
            }
            pokemonAbilitiesTextLabel.text = abilitiesText
            
            var typesText = ""
            for type in pokemon.types {
                typesText += "\(type.type.name)"
            }
            pokemonTypesTextLabel.text = typesText
            
            pokemonIdTextLabel.text = "\(pokemon.id)"
            
            do {
                guard let url = URL(string: pokemon.sprites.front_default) else { return }
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                pokemonImageView.image = image
            } catch {
                print(error)
            }
            
        }
    }
}

extension PokemonDetailViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else { return }
        pokemonApiController?.getPokemon(searchTerm: searchBarText) { (result) in
            switch result {
            case .success(let pokemon):
                print(pokemon)
                self.pokemon = pokemon
                DispatchQueue.main.async {
                    self.updateViews()
                }
            case .failure(let error):
                print("Error fetching pokemon: \(error)")
            }
        }
    }
}

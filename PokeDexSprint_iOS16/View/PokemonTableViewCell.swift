//
//  PokemonTableViewCell.swift
//  PokeDexSprint_iOS16
//
//  Created by Stephanie Ballard on 4/10/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    var pokemon: Pokemon? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var pokemonNameTextLabel: UILabel!

    func updateViews() {
        guard let pokemon = pokemon else { return }
        pokemonNameTextLabel.text = pokemon.name
    }
}

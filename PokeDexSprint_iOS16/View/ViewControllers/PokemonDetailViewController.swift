//
//  PokemonDetailViewController.swift
//  PokeDexSprint_iOS16
//
//  Created by Stephanie Ballard on 4/10/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonNameTextLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonIdTextLabel: UILabel!
    @IBOutlet weak var pokemonTypesTextLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func savePokemonButtonTapped(_ sender: UIButton) {
    }
    
}

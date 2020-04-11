//
//  PokemonViewController.swift
//  PokeDexSprint_iOS16
//
//  Created by Stephanie Ballard on 4/10/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {

    let pokemonApiController = PokemonApiController()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonSearchShowSegue" {
            guard let destination = segue.destination as? PokemonDetailViewController else { return }
            destination.pokemonApiController = pokemonApiController
        } else if segue.identifier == "pokemonCellShowSegue" {
            guard let destination = segue.destination as? PokemonDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else { return }
            destination.pokemon = pokemonApiController.pokedex[indexPath.row]
        }
    }
    

}

extension PokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonApiController.pokedex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokemonTableViewCell else { return UITableViewCell() }
        let pokemon = pokemonApiController.pokedex[indexPath.row]
        cell.pokemon = pokemon
        return cell
    }
}

extension PokemonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pokemonApiController.pokedex.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

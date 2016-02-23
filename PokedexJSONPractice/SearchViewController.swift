//
//  SearchViewController.swift
//  PokedexJSONPractice
//
//  Created by Michael Mecham on 2/22/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var PokemonExperienceLabel: UILabel!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    
    var pokemon = Pokemon?()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let searchTerm = searchBar.text else { return }
        PokemonController.getPokemon(searchTerm) { (pokemon) -> Void in
            guard let pokeResult = pokemon else { return }
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                self.pokemonNameLabel.text = pokeResult.name
                self.pokemonIDLabel.text = "ID: \(pokeResult.id)"
                self.PokemonExperienceLabel.text = "Exp: \(pokeResult.baseExp)"
                self.pokemonHeightLabel.text = "Height: \(pokeResult.height)"
                self.pokemonWeightLabel.text = "Weight: \(pokeResult.weight)"
            })
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: - Search stuff
    
    //        func searchBarSearchButtonClicked(searchBar: UISearchBar) {
    //            searchBar.resignFirstResponder()
    //            let searchTerm = searchBar.text
    //            PokemonController.getPokemonFromSearchTerm(searchTerm!) { (pokemon) -> Void in
    //                self.pokemon = pokemon
    //
    //                dispatch_async(dispatch_get_main_queue(), { () -> Void in
    //                    self.pokemonNameLabel.text = pokemon?.name
    //                    self.PokemonExperienceLabel.text = pokemon?.baseExp
    //                    self.pokemonHeightLabel.text = pokemon?.height
    //                    self.pokemonIDLabel.text = pokemon?.id
    //                    self.pokemonWeightLabel.text = pokemon?.weight
    //                })
    //            }
    //        }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

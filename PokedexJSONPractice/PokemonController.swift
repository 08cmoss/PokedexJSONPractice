//
//  PokemonController.swift
//  PokedexJSONPractice
//
//  Created by Michael Mecham on 2/22/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

class PokemonController {
    
    static let kBaseURLString = "http://pokeapi.co/api/v2/pokemon/"
    
    static func getPokemonFromSearchTerm(searchTerm: String, completion: (pokemon: Pokemon?) -> Void) {
        
        let pokeSearchURLString = PokemonController.kBaseURLString + searchTerm
        let url = NSURL(string: pokeSearchURLString)
        NetworkController.dataAtURL(url!) { (data) -> Void in
            guard let data = data else {
                print("no data return")
                completion(pokemon: nil)
                return
            }
            do {
                let pokemonAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
                var pokemonModelObject: Pokemon?
                if let pokemonDictionary = pokemonAnyObject as? [String: AnyObject] {
                    pokemonModelObject = Pokemon(jsonDictionary: pokemonDictionary)
                }
                completion(pokemon: pokemonModelObject)
            } catch {
                completion(pokemon: nil)
            }
        }
    }
}
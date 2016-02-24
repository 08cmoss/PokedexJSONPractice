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
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var pokeBallActivityImage: UIImageView!
    
    
    var pokemon = Pokemon?()
    
    
    
    let boundRect = CGRectMake(0, 0, 1, 1)
    
    
    func rotateBro() {
        let rotateAnimate = CAKeyframeAnimation()
        rotateAnimate.keyPath = "position"
        rotateAnimate.path = CGPathCreateWithEllipseInRect(boundRect, nil)
        rotateAnimate.duration = 4.0
        rotateAnimate.additive = true
        rotateAnimate.repeatCount = Float.infinity
        rotateAnimate.calculationMode = kCAAnimationPaced
        rotateAnimate.rotationMode = kCAAnimationRotateAuto
        pokeBallActivityImage.layer.addAnimation(rotateAnimate, forKey: "rotate")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokeSearchBar.returnKeyType = .Go
        pokeBallActivityImage.hidden = true
        
        
    }
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        rotateBro()
        pokeBallActivityImage.hidden = false
        
        guard let searchTerm = searchBar.text else { return }
        PokemonController.getPokemon(searchTerm) { (pokemon) -> Void in
            guard let pokeResult = pokemon else { return }
            
            
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.pokeBallActivityImage.hidden = true
                self.pokemonNameLabel.text = pokeResult.name.capitalizedString
                self.pokemonIDLabel.text = "ID: \(pokeResult.id)"
                self.PokemonExperienceLabel.text = "Exp: \(pokeResult.baseExp)"
                self.pokemonHeightLabel.text = "Height: \(pokeResult.height)"
                self.pokemonWeightLabel.text = "Weight: \(pokeResult.weight)"
                self.pokemonImageView.image = UIImage(named: "\(pokeResult.id)")
            })
            
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

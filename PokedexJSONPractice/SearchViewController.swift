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
    @IBOutlet weak var networkActivityIndicator: UIActivityIndicatorView!


    
    var pokemon = Pokemon?()
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokeSearchBar.returnKeyType = .Go
        networkActivityIndicator.hidesWhenStopped = true
   
    }
    
//    override func viewDidAppear(animated: Bool) {
//        print("didAppear")
//        super.viewDidAppear(animated)
//        
//        
//        let pokeballImageView = UIImageView(frame: CGRectMake(view.frame.size.width/2-100, view.frame.size.height/2-100, 200, 200))
//        pokeballImageView.image = UIImage(named: "pokeball")
//        view.addSubview(pokeballImageView)
//        
//        let boundRect = CGRectMake(0, 0, 1, 1)
//        
//        let rotateAnimate = CAKeyframeAnimation()
//        rotateAnimate.keyPath = "position"
//        rotateAnimate.path = CGPathCreateWithEllipseInRect(boundRect, nil)
//        rotateAnimate.duration = 4.0
//        rotateAnimate.additive = true
//        rotateAnimate.repeatCount = Float.infinity
//        rotateAnimate.calculationMode = kCAAnimationPaced
//        rotateAnimate.rotationMode = kCAAnimationRotateAuto
//        pokeballImageView.layer.addAnimation(rotateAnimate, forKey: "rotate")
//        
//
//
//    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.networkActivityIndicator.startAnimating()
//        self.pokeballImageView.hidden = false
//        self.pokeballImageView.startAnimating()
        
        guard let searchTerm = searchBar.text else { return }
        PokemonController.getPokemon(searchTerm) { (pokemon) -> Void in
            guard let pokeResult = pokemon else { return }
            
            
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                self.networkActivityIndicator.stopAnimating()
//                self.pokeballImageView.stopAnimating()
//                self.pokeballImageView.hidden = true
                self.pokemonNameLabel.text = pokeResult.name.capitalizedString
                self.pokemonIDLabel.text = "ID: \(pokeResult.id)"
                self.PokemonExperienceLabel.text = "Exp: \(pokeResult.baseExp)"
                self.pokemonHeightLabel.text = "Height: \(pokeResult.height)"
                self.pokemonWeightLabel.text = "Weight: \(pokeResult.weight)"
                self.pokemonImageView.image = UIImage(named: "\(pokeResult.id)")
            })
            
        }
    }
 
//    
//    let satelliteImageView = UIImageView(frame: CGRectMake(157, 515, 50, 50))
//    satelliteImageView.image = UIImage(named: "satellite")
//    view.addSubview(satelliteImageView)
//    
//    let boundRect = CGRectMake(-60, -60, 170, 170)
//    
//    let orbitAnimation = CAKeyframeAnimation()
//    orbitAnimation.keyPath = "position"
//    orbitAnimation.path = CGPathCreateWithEllipseInRect(boundRect, nil)
//    orbitAnimation.duration = 4.0
//    orbitAnimation.additive = true
//    orbitAnimation.repeatCount = Float.infinity
//    orbitAnimation.calculationMode = kCAAnimationPaced
//    orbitAnimation.rotationMode = kCAAnimationRotateAuto
//    
//    satelliteImageView.layer.addAnimation(orbitAnimation, forKey: "orbit")
//    
//    
//    satelliteImageView.animationImages = [UIImage(named: "satellite")!, UIImage(named: "satellite1")!, UIImage(named: "satellite2")!, UIImage(named: "satellite3")!]
//    satelliteImageView.animationDuration = 2.0
//    satelliteImageView.animationRepeatCount = Int.max
//    satelliteImageView.startAnimating()
    
    

    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

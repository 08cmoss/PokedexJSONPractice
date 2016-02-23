//
//  Pokemon.swift
//  PokedexJSONPractice
//
//  Created by Michael Mecham on 2/22/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

struct Pokemon {
    
    let name: String
    let id: Int
    let baseExp: Int
    let height: Int
    let weight: Int
    
    init?(jsonDictionary: [String: AnyObject]){
        guard let name = jsonDictionary["name"] as? String else { return nil }
        self.name = name
        self.id = jsonDictionary["id"] as? Int ?? 0
        self.baseExp = jsonDictionary["base_experience"] as? Int ?? 0
        self.height = jsonDictionary["height"] as? Int ?? 0
        self.weight = jsonDictionary["weight"] as? Int ?? 0
        
    }
    
    
//    private let kID = "id"
//    private let kName = "name"
//    private let kBaseEXP = "base_experience"
//    private let kHeight = "height"
//    private let kWeight = "weight"
//    
//    var id: String?
//    var name: String?
//    var baseExp: String?
//    var height: String?
//    var weight: String?
//    
//    
//    init?(jsonDictionary: [String: AnyObject]){
//        guard let name = jsonDictionary[kName] as? String else { return nil }
//        self.id = jsonDictionary[kID] as? String ?? ""
//        self.name = name
//        self.baseExp = jsonDictionary[kBaseEXP] as? String ?? ""
//        self.height = jsonDictionary[kHeight] as? String ?? ""
//        self.weight = jsonDictionary[kWeight] as? String ?? ""
//    }
//    
}



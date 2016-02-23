//
//  Pokemon.swift
//  PokedexJSONPractice
//
//  Created by Michael Mecham on 2/22/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

struct Pokemon {
    
    private let kID = "id"
    private let kName = "name"
    private let kBaseEXP = "base_experience"
    private let kHeight = "height"
    private let kWeight = "weight"
    
    var id: String?
    var name: String?
    var baseExp: String?
    var height: String?
    var weight: String?
    
    
    init?(jsonDictionary: [String: AnyObject]){
        guard let name = jsonDictionary[kName] as? String else { return nil }
        self.id = jsonDictionary[kID] as? String ?? ""
        self.name = name
        self.baseExp = jsonDictionary[kBaseEXP] as? String ?? ""
        self.height = jsonDictionary[kHeight] as? String ?? ""
        self.weight = jsonDictionary[kWeight] as? String ?? ""
    }
    
}



//
//  Species.swift
//  PokemonApp
//
//  Created by Aamir khan on 24/04/23.
//

import Foundation

//MARK: Model class for name of pokemon.
class Species:Codable{
    var name :String?
    init(name: String? = nil) {
        self.name = name
    }
}

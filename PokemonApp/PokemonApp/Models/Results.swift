//
//  pokemonDataModel.swift
//  PokemonApp
//
//  Created by Aamir khan on 19/04/23.
//

import Foundation

//MARK: Model class for name and URL of details of pokemon.
class Results:Codable{
    var name : String
    var url : String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

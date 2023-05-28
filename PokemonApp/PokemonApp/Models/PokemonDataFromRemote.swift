//
//  PokemonDataFromRemote.swift
//  PokemonApp
//
//  Created by Aamir khan on 19/04/23.
//

import Foundation

//MARK: Model class for details of pokemon.
class pokemonDataFromRemote:Codable{
    
    var results : [Results]
    init(results: [Results]) {
        self.results = results
    }
}

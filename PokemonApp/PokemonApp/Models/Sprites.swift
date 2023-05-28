//
//  Sprites.swift
//  PokemonApp
//
//  Created by Aamir khan on 20/04/23.
//

import Foundation

//MARK: Model class for image of pokemon.
class Sprites:Codable{
    var front_default : String?
    
    init(front_default: String?) {
        self.front_default = front_default
    }
}

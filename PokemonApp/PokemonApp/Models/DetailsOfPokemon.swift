//
//  DetailsOfPokemon.swift
//  PokemonApp
//
//  Created by Aamir khan on 24/04/23.
//

import Foundation

//MARK: Model class for details of pokemon.
class MoreDetailsOfPokemon:Codable{
    
    var height : Int?
    var weight : Int?
    var sprites : Sprites
    var species : Species
    
    init(height: Int? = nil, weight: Int? = nil, sprites: Sprites, species: Species) {
        self.height = height
        self.weight = weight
        self.sprites = sprites
        self.species = species
    }
}

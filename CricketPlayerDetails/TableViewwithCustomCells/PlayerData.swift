//
//  PlayerData.swift
//  TableViewwithCustomCells
//
//  Created by Aamir khan on 29/03/23.
//

import Foundation

class PlayerData{
    var playerName : String
    var playerCountry : String
    var PlayerRating : Int
    var PlayerImage : String
    
    init(playerName : String, playerCountry : String, PlayerRating : Int, PlayerImage : String){
        self.playerName = playerName
        self.playerCountry = playerCountry
        self.PlayerRating = PlayerRating
        self.PlayerImage = PlayerImage
    }
}

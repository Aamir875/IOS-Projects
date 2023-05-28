//
//  EnumForConstants.swift
//  PokemonApp
//
//  Created by Aamir khan on 24/04/23.
//

import Foundation

enum IntegerConstants:Int{
    case zero = 0,
    one = 1,
    four = 4,
    eight = 8,
    sixteen = 16,
    twoHundred = 200
}

enum DoubleConstants : Double{
    case three = 3.0
}

enum StringConstants : String{
    case defaultImage = "Scarlet",
    cellOfDetailView = "cellForDetailsView",
    storyBoardIdOfDetailsViewController = "detailViewController",
    cellForViewController = "cell",
    emptyString = "",
    defaultMessageForDownload = "unable to download image",
    defaultDecodeMessage = "Unable to decode Data",
    image = "image"
}

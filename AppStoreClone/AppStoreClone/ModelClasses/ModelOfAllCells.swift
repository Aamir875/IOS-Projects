//
//  ModelOfCellOne.swift
//  AppStoreClone
//
//  Created by Aamir khan on 28/04/23.
//

import Foundation

class ModelOfCellOne{
    
    var headerName : String
    var labelOne : String
    var labelTwo : String
    var labelThree : String
    var labelFour : String
    var labelFive : String
    var largeImage : String
    var iconImage : String
    
    init(headerName: String, labelOne: String, labelTwo: String, labelThree: String, labelFour: String, labelFive: String, largeImage: String, iconImage: String) {
        self.headerName = headerName
        self.labelOne = labelOne
        self.labelTwo = labelTwo
        self.labelThree = labelThree
        self.labelFour = labelFour
        self.labelFive = labelFive
        self.largeImage = largeImage
        self.iconImage = iconImage
    }
}

class ModelOfCellTwo{
    var labelOne : String
    var labeTwo : String
    var lableThree : String
    var lableFour : String
    var lableFive : String
    var lableSix : String
    var iconImageOne : String
    var iconImageTwo : String
    var iconImageThree : String
    
    init(labelOne: String, labeTwo: String, lableThree: String, lableFour: String, lableFive: String, lableSix: String, iconImageOne: String, iconImageTwo: String, iconImageThree: String) {
        self.labelOne = labelOne
        self.labeTwo = labeTwo
        self.lableThree = lableThree
        self.lableFour = lableFour
        self.lableFive = lableFive
        self.lableSix = lableSix
        self.iconImageOne = iconImageOne
        self.iconImageTwo = iconImageTwo
        self.iconImageThree = iconImageThree
    }
}

class ModelOfCellThree{
    var labelOne:String
    var labelTwo:String
    var labelThree:String
    var labelFour:String
    var labelFive:String
    var largeImage:String
    var imageIcon:String
    
    init(labelOne: String, labelTwo: String, labelThree: String, labelFour: String, labelFive: String, largeImage: String, imageIcon: String) {
        self.labelOne = labelOne
        self.labelTwo = labelTwo
        self.labelThree = labelThree
        self.labelFour = labelFour
        self.labelFive = labelFive
        self.largeImage = largeImage
        self.imageIcon = imageIcon
    }
}

class ModelOfCellFour{
    var labelOne:String
    var labelTwo:String
    var labelThree:String
    var image:String
    
    init(labelOne: String, labelTwo: String, labelThree: String, image: String) {
        self.labelOne = labelOne
        self.labelTwo = labelTwo
        self.labelThree = labelThree
        self.image = image
    }
}

class ModelOfCellFive{
    var labelOne:String
    var labelTwo:String
    var labelThree:String
    var labelFour:String
    var imageOne:String
    var imageTwo:String
    
    init(labelOne: String, labelTwo: String, labelThree: String, labelFour: String, imageOne: String, imageTwo: String) {
        self.labelOne = labelOne
        self.labelTwo = labelTwo
        self.labelThree = labelThree
        self.labelFour = labelFour
        self.imageOne = imageOne
        self.imageTwo = imageTwo
    }
}

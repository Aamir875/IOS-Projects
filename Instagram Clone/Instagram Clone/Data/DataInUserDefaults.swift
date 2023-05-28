//
//  DataInUserDefaults.swift
//  Instagram Clone
//
//  Created by Aamir khan on 25/04/23.
//

import Foundation
class ImageData{
    
    static var instance = ImageData()
    var items = ["TravelImage1","TravelImage2","TravelImage3","TravelImage4","TravelImage5","TravelImage6","TravelImage7","TravelImage8","TravelImage9","TravelImage10"]
    
    func getItems()->[String]{
        guard let listOfImages = UserDefaults.standard.array(forKey: "listOfImages") as? [String] else { return [] }
        return listOfImages
    }
    
    func setItems(newValue : String){
        items.append(newValue)
    }
}

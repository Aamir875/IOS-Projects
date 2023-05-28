//
//  LocationModel.swift
//  LocateMap
//
//  Created by Aamir khan on 06/04/23.
//

import Foundation
import UIKit

class LocationModel:Codable{
    var textInLabel :String
    var latitude : Double
    var longitude : Double
    
    init(textInLabel: String, latitude : Double, longitude : Double) {
        self.textInLabel = textInLabel
        self.latitude = latitude
        self.longitude = longitude
    }
}

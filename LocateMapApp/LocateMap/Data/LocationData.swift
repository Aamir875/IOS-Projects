//
//  LocationModel.swift
//  LocateMap
//
//  Created by Aamir khan on 06/04/23.
//

import Foundation

class LocationData{
    static var instance = LocationData()
    var items = [LocationModel(textInLabel: "Noida",latitude: 28.5355, longitude: 77.3910),
                 LocationModel(textInLabel: "Mumbai", latitude: 19.0760, longitude:72.8777),
                 LocationModel(textInLabel: "Hyderabad", latitude: 17.3850, longitude: 78.4867),
                 LocationModel(textInLabel: "Kolkata", latitude: 22.5726, longitude: 88.3639),
                 LocationModel(textInLabel: "Chennai", latitude: 13.0827, longitude: 80.2707),
                 LocationModel(textInLabel: "Delhi", latitude:28.7041, longitude:77.1025),
                 LocationModel(textInLabel: "Pune", latitude: 18.5204, longitude: 73.8567)] {
        didSet {
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()
    
                // Encode items
                let data = try encoder.encode(items)
    
                // Write/Set Data
                UserDefaults.standard.setValue(data, forKey: "array")
    
            } catch {
                print("Unable to Encode Array of items (\(error))")
            }
        }
    }
    
    func getItems()->[LocationModel]{
        if let data = UserDefaults.standard.data(forKey: "array") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                // Decode Items
                let decoded = try decoder.decode([LocationModel].self, from: data)
                let arrayForLocation = decoded
                return arrayForLocation
            } catch {
                print("Unable to Decode items (\(error))")
                return self.items
            }
        } else {
            return self.items
        }
    }
    
    func addItems(value : LocationModel){
        self.items.append(value)
    }
}

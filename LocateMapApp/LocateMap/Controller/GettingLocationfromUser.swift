//
//  GettingLocationfromUser.swift
//  LocateMap
//
//  Created by Aamir khan on 06/04/23.
//

import UIKit

class GettingLocationfromUser: UIViewController {
    
    @IBOutlet weak var tableForAddress: UITableView!
    @IBOutlet weak var mySeachText: UISearchBar!
    
    var arrayForLocation = [LocationModel]()
    var searching = false
    var searchArray = [LocationModel]()
    
    //Mark : gives Current location set by admin
    @IBAction func currentLocation(_ sender: Any) {
        AccessLocation.latitude = 28.49538
        AccessLocation.longitude = 77.40432
        guard let toMapKit = self.storyboard?.instantiateViewController(withIdentifier: "AccessLocation") as? AccessLocation else{return}
        self.navigationController?.pushViewController(toMapKit, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayForLocation = LocationData.instance.getItems()
    }
}

extension GettingLocationfromUser : UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate{
    
    //Mark : Returns the number of cell in table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchArray.count
        }
        else{
            return arrayForLocation.count
        }
    }
    
    //Mark : Adds Data to the cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableForAddress.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if searching{
            Cell.textLabel?.text = searchArray[indexPath.row].textInLabel
        }
        else{
            Cell.textLabel?.text = arrayForLocation[indexPath.row].textInLabel
        }
        return Cell
    }
    
    //Mark : implementation of onClickCell()
    func onClickCell(indexPath : IndexPath){
        if searching{
            let nameToLocate = searchArray[0]
            let latitudeOfSearchedItem = nameToLocate.latitude
            let longitudeOfSearchedItem = nameToLocate.longitude
            AccessLocation.latitude = latitudeOfSearchedItem
            AccessLocation.longitude = longitudeOfSearchedItem
        }
        else{
            let nameToLocate = arrayForLocation[indexPath.row]
            let latitudeOfSelectedItem = nameToLocate.latitude
            let longitudeOfSelectedItem = nameToLocate.longitude
            AccessLocation.latitude = latitudeOfSelectedItem
            AccessLocation.longitude = longitudeOfSelectedItem
        }
        tableForAddress.deselectRow(at: indexPath, animated: true)
        guard let toMapKit = self.storyboard?.instantiateViewController(withIdentifier: "AccessLocation") as? AccessLocation else{return}
        self.navigationController?.pushViewController(toMapKit, animated: true)
    }
    
    //Mark : Direct to AccessLocation Class with latitude and longitude of required location.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onClickCell(indexPath: indexPath)
    }
    
    //Mark : Perform Search operation from the already exiting locations in tableView
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchArray = []
        searching = true
        for placeName in arrayForLocation{
            if placeName.textInLabel == ""{
                searchArray = arrayForLocation
            }
            else{
                if placeName.textInLabel.lowercased().contains(mySeachText.text?.lowercased() ?? "Invalid Value"){
                    searchArray.append(placeName)
                }
            }
            tableForAddress.reloadData()
        }
    }
}

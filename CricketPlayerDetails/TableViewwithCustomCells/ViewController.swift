//
//  ViewController.swift
//  TableViewwithCustomCells
//
//  Created by Aamir khan on 29/03/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myTable: UITableView!
    
    var listOfPlayer = [PlayerData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Player1 = PlayerData(playerName: "Virat Kohli", playerCountry: "India", PlayerRating: 870, PlayerImage: "virat kohli image copy")
        listOfPlayer.append(Player1)
        let player2 = PlayerData(playerName: "Rohit Sharma", playerCountry: "India", PlayerRating: 850, PlayerImage: "rohit sharma image copy")
        listOfPlayer.append(player2)
        let player3 = PlayerData(playerName: "Surya kumar yadav", playerCountry: "India", PlayerRating: 840, PlayerImage: "surya's image")
        listOfPlayer.append(player3)
    }
}

extension  ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPlayer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        cell.playerRanking.text = "\(indexPath.row+1)"
        cell.playerCountry.text = listOfPlayer[indexPath.row].playerCountry
        cell.playerName.text = listOfPlayer[indexPath.row].playerName
        let thevalue = listOfPlayer[indexPath.row].PlayerRating
        cell.playerRating.text = "\(thevalue)"
        cell.playerPhoto.image = UIImage(named: listOfPlayer[indexPath.row].PlayerImage)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
}

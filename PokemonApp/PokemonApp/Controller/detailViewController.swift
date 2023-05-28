//
//  detailViewController.swift
//  PokemonApp
//
//  Created by Aamir khan on 24/04/23.
//

import UIKit

class detailViewController: UIViewController {
    
    var urlFromFirst : String?
    var listOfDetails : MoreDetailsOfPokemon?
    
    @IBOutlet weak var tableViewForDetailViewController: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDetails()
    }
    
    //MARK: Fetch details of pokemon from remote using URL of given JSON data.
    func fetchDetails(){
        guard let url = URL(string: urlFromFirst ?? StringConstants.emptyString.rawValue) else {return}
        let task = URLSession.shared.dataTask(with: url) {[weak self]
            (data,response,error) in
            guard let data = data, error == nil
            else {
                print("Unable to Fetch Data \(error)")
                return
            }
            do{
                self?.listOfDetails = try JSONDecoder().decode(MoreDetailsOfPokemon.self, from: data)
            } catch {
                print(StringConstants.defaultDecodeMessage.rawValue)
                return
            }
            DispatchQueue.main.async {
                self?.tableViewForDetailViewController.reloadData()
            }
        }
        task.resume()
    }
}

//MARK: Configures table view.
extension detailViewController : UITableViewDelegate,UITableViewDataSource{
    
    //MARK: Returns number of rows in table view.
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return IntegerConstants.one.rawValue
    }
    
    //MARK: Configure data in table view cell.
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let Cell = tableViewForDetailViewController.dequeueReusableCell(withIdentifier: StringConstants.cellOfDetailView.rawValue,for: indexPath) as? TableViewCellForSecond else {return UITableViewCell(style: .default, reuseIdentifier: StringConstants.cellOfDetailView.rawValue)}
        
        return TableViewCellForSecond.insertDataInCell(indexPath: indexPath,
                                                       listOfDetails:listOfDetails,
                                                       Cell:Cell)
    }
}

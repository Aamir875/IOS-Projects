//
//  StateViewController.swift
//  PracticeOfCoreData
//
//  Created by Aamir khan on 17/04/23.
//

import UIKit
import CoreData

class StateViewController: UIViewController {

    let contextState = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static var listOfStates : [State]?
    @IBOutlet weak var tableViewForState: UITableView!
    
    //MARK: Performs action when add button is clicked.
    @IBAction func addStateToTabel(_ sender: Any) {
        onClickAddUserButton()
    }
    
    //
    func onClickAddUserButton(){
        let alert = UIAlertController(title: StringConstants.add.rawValue, message: StringConstants.addState.rawValue, preferredStyle: .alert)
        alert.addTextField()
        let submitButton = UIAlertAction(title: StringConstants.add.rawValue, style: .default){
            [weak self] (action) in
            let textfield = alert.textFields?[IntegerConstants.zero.rawValue]
            let newState = State(context: self?.contextState ?? NSManagedObjectContext())
            newState.stateName = textfield?.text
            do{
                try self?.contextState.save()
            } catch{
                print(StringConstants.notAbleToSave.rawValue)
            }
            self?.fetchStates()
        }
        alert.addAction(submitButton)
        self.present(alert,animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchStates()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Fetches data from database.
    func fetchStates(){
        do{
            try StateViewController.listOfStates = contextState.fetch(State.fetchRequest())
            DispatchQueue.main.async(){
                self.tableViewForState.reloadData()
            }
        } catch{
            print(StringConstants.notAbleToFetchData.rawValue)
        }
    }
}

extension StateViewController : UITableViewDelegate,UITableViewDataSource{
    
    //MARK: Returns rows in section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StateViewController.listOfStates?.count ?? IntegerConstants.zero.rawValue
    }
    
    //MARK: Redirect to page where total users are present.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let moveToUsersView = self.storyboard?.instantiateViewController(withIdentifier: StringConstants.viewController.rawValue) as? ViewController else {return}
        moveToUsersView.stateObj = StateViewController.listOfStates?[indexPath.row]
        self.navigationController?.pushViewController(moveToUsersView,
                                                      animated: true)
        
    }
    
    //MARK: Provides value to cell in a given row.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let Cell = tableViewForState.dequeueReusableCell(withIdentifier: StringConstants.cell.rawValue) as? TableViewCellForState else { return UITableViewCell(style: .default,reuseIdentifier: StringConstants.cell.rawValue) }
        return TableViewCellForState.addDataInCell(Cell: Cell,
                                                   indexPath: indexPath)
    }
    
    //MARK: Delete cell when a cell is swiped.
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return TableViewCellForState.swipeAction(indexPath:indexPath,
                                                 contextState: contextState,
                                                 tableViewForState: tableViewForState)
    }
}

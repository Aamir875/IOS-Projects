//
//  ViewController.swift
//  PracticeOfCoreData
//
//  Created by Aamir khan on 14/04/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableForUser: UITableView!
    static var arrayOfUser : [User]?
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    var stateObj : State?
    
    //MARK: ADD user data in database.
    @IBAction func addUserInCoreData(_ sender: Any) {
        onclickPlusButton()
    }
    
    func onclickPlusButton(){
        let alert = UIAlertController(title: StringConstants.addUser.rawValue, message: StringConstants.addNewUser.rawValue, preferredStyle: .alert)
        alert.addTextField()
        let submitButton = UIAlertAction(title: StringConstants.add.rawValue, style: .default){[weak self] (action) in
            
            let textfield = alert.textFields?[IntegerConstants.zero.rawValue]
            
            let newUser = User(context: self?.context ?? NSManagedObjectContext())
            newUser.name = textfield?.text
            newUser.age = Int16(IntegerConstants.twenty.rawValue)
            newUser.gender = StringConstants.gender.rawValue
            do{
                self?.stateObj?.addToUsers(newUser)
                try self?.context?.save()
            }
            catch{
                print(StringConstants.notAbleToSave.rawValue)
            }
            self?.fetchUser()
        }
        alert.addAction(submitButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Fetches user data from Coredata.
    func fetchUser(){
        ViewController.arrayOfUser = stateObj?.users?.allObjects as? [User]
            DispatchQueue.main.async {
                self.tableForUser.reloadData()
            }
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    //MARK: Returns total number of rows in section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.arrayOfUser?.count ?? IntegerConstants.zero.rawValue
    }
    
    //MARK: Deletes the cell when a cell is swiped.
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return TableViewCell.swipeAction(indexPath: indexPath,
                                         context : context ?? NSManagedObjectContext(),
                                         stateObj : stateObj,
                                         tableForUser: tableForUser)
    }
    
    //MARK: Changes value of user when someone taps on the cell.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = TableViewCell.performActionOnSelection(indexPath: indexPath,
                                                           context: context ?? NSManagedObjectContext(),
                                                           stateObj: stateObj,
                                                           tableForUser: tableForUser)
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: Enters the user data in cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let Cell = tableForUser.dequeueReusableCell(withIdentifier: StringConstants.cell.rawValue) as? TableViewCell else {return UITableViewCell(style: .default, reuseIdentifier: StringConstants.cell.rawValue)}
        return TableViewCell.addDataInFunc(Cell: Cell,
                                           indexPath: indexPath)
    }
}

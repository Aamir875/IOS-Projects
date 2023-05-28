//
//  TableViewCell.swift
//  PracticeOfCoreData
//
//  Created by Aamir khan on 14/04/23.
//

import UIKit
import CoreData

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewOfCell: UIView!
    @IBOutlet weak var labelForUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Deletes cell when the cell is swiped.
    static func swipeAction(indexPath : IndexPath, context : NSManagedObjectContext, stateObj : State?, tableForUser:UITableView)->UISwipeActionsConfiguration{
        
        let action = UIContextualAction(style: .destructive,
                                        title: StringConstants.delete.rawValue){
            (action,view,completionhandler) in
            
            let userToRemove = ViewController.arrayOfUser?[indexPath.row]
            context.delete(userToRemove ?? User())
            do{
                try context.save()
            }
            catch{
                print(StringConstants.unableToDelete.rawValue)
            }
            ViewController.arrayOfUser = stateObj?.users?.allObjects as? [User] ?? []
                DispatchQueue.main.async {
                    tableForUser.reloadData()
                }
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    //MARK: Provides Edit functionality by which user name can be edited when clicked on cell.
    static func performActionOnSelection(indexPath : IndexPath, context : NSManagedObjectContext, stateObj : State?, tableForUser : UITableView)->UIAlertController{
        
        let user = ViewController.arrayOfUser?[indexPath.row]
        let alert = UIAlertController(title: StringConstants.editInfo.rawValue,
                                      message: StringConstants.editName.rawValue,
                                      preferredStyle: .alert)
        alert.addTextField()
        let textfield = alert.textFields?[IntegerConstants.zero.rawValue]
        textfield?.text = user?.name
        let  saveButton = UIAlertAction(title: StringConstants.save.rawValue,
                                        style: .default){(action) in
            let textfield = alert.textFields?[IntegerConstants.zero.rawValue]
            user?.name = textfield?.text
            do{
                try context.save()
            }
            catch{
                print(StringConstants.notAbleToSave.rawValue)
            }
            ViewController.arrayOfUser = stateObj?.users?.allObjects as? [User] ?? []
                DispatchQueue.main.async {
                    tableForUser.reloadData()
                }
        }
        alert.addAction(saveButton)
        return alert
    }
    
    //MARK: Adds data in cell.
    static func addDataInFunc(Cell : TableViewCell, indexPath : IndexPath)->UITableViewCell{
        Cell.labelForUserName.text = ViewController.arrayOfUser?[indexPath.row].name
        Cell.viewOfCell.layer.cornerRadius = Cell.frame.height/CGFloat(IntegerConstants.four.rawValue)
        return Cell
    }
}

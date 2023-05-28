//
//  TableViewCellForState.swift
//  PracticeOfCoreData
//
//  Created by Aamir khan on 17/04/23.
//

import UIKit
import CoreData

class TableViewCellForState: UITableViewCell {

    @IBOutlet weak var viewOfStateCell: UIView!
    @IBOutlet weak var labelForState: UILabel!
    
    //MARK: Deletes cell when the cell is swiped.
    static func swipeAction(indexPath : IndexPath, contextState : NSManagedObjectContext,tableViewForState : UITableView) -> UISwipeActionsConfiguration{
        
        let alert = UIContextualAction(style: .destructive, title: StringConstants.delete.rawValue){
            (alert,view,completionhandler) in
            guard let stateToBeDeleted = StateViewController.listOfStates?[indexPath.row] else {return}
            contextState.delete(stateToBeDeleted)
            do{
                try contextState.save()
            } catch{
                print(StringConstants.notAbleToSave.rawValue)
            }
            do{
                try StateViewController.listOfStates = contextState.fetch(State.fetchRequest())
                DispatchQueue.main.async(){
                    tableViewForState.reloadData()
                }
            } catch{
                print(StringConstants.notAbleToFetchData.rawValue)
            }
        }
        return UISwipeActionsConfiguration(actions: [alert])
    }
    
    //MARK: Adds value in cell of tableview.
    static func addDataInCell(Cell : TableViewCellForState, indexPath : IndexPath)->UITableViewCell{
        Cell.labelForState.text = StateViewController.listOfStates?[indexPath.row].stateName
        Cell.viewOfStateCell.layer.cornerRadius = (Cell.frame.height )/CGFloat(IntegerConstants.four.rawValue)
        return Cell
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

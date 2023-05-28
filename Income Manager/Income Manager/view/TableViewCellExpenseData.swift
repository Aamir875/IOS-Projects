//
//  TableViewCellExpenseData.swift
//  Income Manager
//
//  Created by Aamir khan on 12/04/23.
//

import UIKit

class TableViewCellExpenseData: UITableViewCell {
    
    @IBOutlet weak var imageForCell: UIImageView!
    @IBOutlet weak var labelForTypeOfExpense: UILabel!
    @IBOutlet weak var labelForTiming: UILabel!
    @IBOutlet weak var labelForAmount: UILabel!
    
    static func addDataToCell(Cell : TableViewCellExpenseData, arrayOfExpenseTypes:[ExpenseDataModel],indexPath : IndexPath)->TableViewCellExpenseData{
        
        Cell.imageForCell.image = UIImage(named: arrayOfExpenseTypes[indexPath.section].imageInCell)
        Cell.labelForTypeOfExpense.text = arrayOfExpenseTypes[indexPath.section].typeExpense
        Cell.labelForTiming.text = arrayOfExpenseTypes[indexPath.section].timeOfExpense
        Cell.labelForAmount.text = arrayOfExpenseTypes[indexPath.section].amount
        Cell.imageForCell.layer.cornerRadius = Cell.imageForCell.frame.height/CGFloat(GeneralIntergerValues.two.rawValue)
        
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

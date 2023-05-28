//
//  tableViewCellForCategoryTableViewCell.swift
//  Income Manager
//
//  Created by Aamir khan on 12/04/23.
//

import UIKit

class tableViewCellForCategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewOfCategory: UIImageView!
    @IBOutlet weak var labelForCategory: UILabel!
    @IBOutlet weak var buttonToCheckMore: UIButton!
    
    static func addDataToCell(Cell:tableViewCellForCategoryTableViewCell,indexPath:IndexPath,searching:Bool,searchArray : [CategoryModel],arrayOfCategory : [CategoryModel])->tableViewCellForCategoryTableViewCell{
        
        if searching{
            Cell.imageViewOfCategory.image = UIImage(named: searchArray[indexPath.section].imageForCategory[indexPath.row] )
            Cell.imageViewOfCategory.layer.cornerRadius =
            Cell.imageViewOfCategory.frame.height/CGFloat(GeneralIntergerValues.two.rawValue)
            Cell.labelForCategory.text = searchArray[indexPath.section].categoryName[indexPath.row]
        } else {
            Cell.imageViewOfCategory.image = UIImage(named: arrayOfCategory[indexPath.section].imageForCategory[indexPath.row] )
            Cell.imageViewOfCategory.layer.cornerRadius =
            Cell.imageViewOfCategory.frame.height/CGFloat(GeneralIntergerValues.two.rawValue)
            Cell.labelForCategory.text = arrayOfCategory[indexPath.section].categoryName[indexPath.row]
        }
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

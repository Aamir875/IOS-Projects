//
//  LowerCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by Aamir khan on 04/04/23.
//

import Foundation
import UIKit

class LowerCollectionViewCell : UICollectionViewCell{
    
    @IBOutlet weak var lowerImageView: UIImageView!
    @IBOutlet weak var lowerLabel: UILabel!
    @IBOutlet weak var lowerSecondImageView: UIImageView!
    
    static func assignDataToCell(Cell : LowerCollectionViewCell, itemsInLower : [LowerCollectionViewModel], index : IndexPath)->LowerCollectionViewCell{
        Cell.lowerImageView.image = UIImage(named: itemsInLower[index.row].imageInLabelSmall)
        Cell.lowerImageView.layer.borderWidth = 1
        Cell.lowerImageView.layer.masksToBounds = true
        Cell.lowerImageView.layer.cornerRadius = Cell.lowerImageView.frame.height/2
        Cell.lowerLabel.text = itemsInLower[index.row].textInLabel
        Cell.lowerSecondImageView.image = UIImage(named: itemsInLower[index.row].imageInLabelLarge)
        return Cell
    }
    
}

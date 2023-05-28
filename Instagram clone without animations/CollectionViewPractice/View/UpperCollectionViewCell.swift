//
//  UpperCollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by Aamir khan on 04/04/23.
//

import UIKit

class UpperCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var upperImageLabel: UIImageView!
    @IBOutlet weak var upperLabel: UILabel!
    
    static func assignDataToCell(Cell : UpperCollectionViewCell, itemsInUpper : [UpperCollectionViewModel], index : IndexPath)->UpperCollectionViewCell{
        Cell.upperImageLabel.image = UIImage(named: itemsInUpper[index.row].imageInLabel)
        Cell.upperImageLabel.layer.borderWidth = 1
        Cell.upperImageLabel.layer.masksToBounds = true
        Cell.upperImageLabel.layer.cornerRadius = Cell.upperImageLabel.frame.height/2
        Cell.upperLabel.text = itemsInUpper[index.row].textInLabel
        return Cell
    }
}

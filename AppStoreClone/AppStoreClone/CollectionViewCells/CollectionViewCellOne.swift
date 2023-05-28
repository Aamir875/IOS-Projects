//
//  CollectionViewCellOne.swift
//  AppStoreClone
//
//  Created by Aamir khan on 28/04/23.
//

import UIKit

class CollectionViewCellOne: UICollectionViewCell {

    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var largeImage: UIImageView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var nameOfApp: UILabel!
    @IBOutlet weak var smallDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

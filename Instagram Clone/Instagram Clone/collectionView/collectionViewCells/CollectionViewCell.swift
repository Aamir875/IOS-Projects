//
//  CollectionViewCell.swift
//  Instagram Clone
//
//  Created by Aamir khan on 26/04/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewInCell: UIImageView!
    @IBOutlet weak var likeDislikeButton: UIButton!
    @IBOutlet weak var imageViewForPerson: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

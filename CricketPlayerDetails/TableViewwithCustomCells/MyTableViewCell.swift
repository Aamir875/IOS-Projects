//
//  MyTableViewCell.swift
//  TableViewwithCustomCells
//
//  Created by Aamir khan on 29/03/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerCountry: UILabel!
    @IBOutlet weak var playerRating: UILabel!
    @IBOutlet weak var playerPhoto: UIImageView!
    @IBOutlet weak var playerRanking: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

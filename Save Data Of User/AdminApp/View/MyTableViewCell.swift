//
//  MyTableViewCell.swift
//  Admin App for Organisation
//
//  Created by Aamir khan on 31/03/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var contactNumberLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var designationLabel: UILabel!
    
    @IBOutlet weak var alternateLabel: UILabel!
    
    @IBOutlet weak var bloodGroupLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

//
//  TableViewCellForSecond.swift
//  PokemonApp
//
//  Created by Aamir khan on 24/04/23.
//

import UIKit

class TableViewCellForSecond: UITableViewCell {

    @IBOutlet weak var viewForCell: UIView!
    @IBOutlet weak var imageViewForPokemon: UIImageView!
    @IBOutlet weak var labelForHeight: UILabel!
    @IBOutlet weak var labelForWidth: UILabel!
    @IBOutlet weak var labelForMoreDetails: UILabel!
    
    //MARK: Configure data in cell.
    static func insertDataInCell(indexPath : IndexPath,
                                 listOfDetails : MoreDetailsOfPokemon?,
                                 Cell : TableViewCellForSecond)-> UITableViewCell {
        
        if listOfDetails?.sprites.front_default != nil{
            let url = URL(string: listOfDetails?.sprites.front_default ?? StringConstants.emptyString.rawValue)
            Cell.imageViewForPokemon.downloadImage(url: url!)
        }
        else {
            Cell.imageViewForPokemon.image = UIImage(named: StringConstants.defaultImage.rawValue)
        }
        Cell.imageViewForPokemon.layer.borderWidth = DoubleConstants.three.rawValue
        Cell.imageViewForPokemon.layer.cornerRadius = Cell.imageViewForPokemon.frame.height/CGFloat(IntegerConstants.eight.rawValue)
        Cell.labelForHeight.text = "\(listOfDetails?.height ?? IntegerConstants.zero.rawValue)"
        Cell.labelForWidth.text = "\(listOfDetails?.weight ?? IntegerConstants.zero.rawValue)"
        Cell.labelForMoreDetails.text = "More details of \(listOfDetails?.species.name ?? "") :-"
        Cell.viewForCell.layer.cornerRadius = Cell.viewForCell.frame.height/CGFloat(IntegerConstants.sixteen.rawValue)
        return Cell
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

//MARK: Fetches image from remote using URL of JSON data.
extension UIImageView{
    func downloadImage(url:URL){
        let dataTask = URLSession.shared.dataTask(with: url){
        (data,response,error) in
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == IntegerConstants.twoHundred.rawValue,
                  let mimeType = response?.mimeType,
                  mimeType.hasPrefix(StringConstants.image.rawValue),
                  let data = data,
                  error == nil,
                  let image = UIImage(data: data)
            else{
                print(StringConstants.defaultMessageForDownload.rawValue)
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        dataTask.resume()
    }
}

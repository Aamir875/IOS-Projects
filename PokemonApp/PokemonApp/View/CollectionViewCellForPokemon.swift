//
//  CollectionViewCellForPokemon.swift
//  PokemonApp
//
//  Created by Aamir khan on 19/04/23.
//

import UIKit

class CollectionViewCellForPokemon: UICollectionViewCell {

    @IBOutlet weak var labelForPokemonName: UILabel!
    
    //MARK: Configure data in cell.
    static func configureDataInCell(Cell:CollectionViewCellForPokemon,
                                    arrayOfPokemon:[Results],
                                    indexPath : IndexPath) -> UICollectionViewCell{
        Cell.labelForPokemonName.text = arrayOfPokemon[indexPath.row].name
        Cell.labelForPokemonName.layer.cornerRadius = Cell.frame.height/CGFloat(IntegerConstants.four.rawValue)
        return Cell
    }
}

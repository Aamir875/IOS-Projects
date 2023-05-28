//
//  TableViewCell.swift
//  AppStoreClone
//
//  Created by Aamir khan on 28/04/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myCollectionView : UICollectionView!
    var listOfItems : [ModelOfCellOne]?
    var listOfItemsForCellTwo : [ModelOfCellTwo]?
    var listOfItemsForCellThree : [ModelOfCellThree]?
    var listOfItemsForCellFour : [ModelOfCellFour]?
    var listOfItemsForCellFive : [ModelOfCellFive]?

    override func awakeFromNib(){
        super.awakeFromNib()
        setUpCollectionView()
        registerNibFilesToCollectionView()
        gettingDataForCells()
    }
    
    func gettingDataForCells(){
        listOfItems = DataClassForCellOne.instance.items
        listOfItemsForCellTwo = DataClassForCellTwo.instance.getItems()
        listOfItemsForCellThree = DataClassForCellThree.instance.getItems()
        listOfItemsForCellFour = DataClassForCellFour.instance.getItems()
        listOfItemsForCellFive = DataClassForCellFive.instance.getItems()
    }
    
    func registerNibFilesToCollectionView(){
        myCollectionView.register(UINib(nibName: "CollectionViewCellOne", bundle: nil), forCellWithReuseIdentifier: "cellOne")
        myCollectionView.register(UINib(nibName: "CollectionViewCellTwo", bundle: nil), forCellWithReuseIdentifier: "cellTwo")
        myCollectionView.register(UINib(nibName: "CollectionViewCellThree", bundle: nil), forCellWithReuseIdentifier: "cellThree")
        myCollectionView.register(UINib(nibName: "CollectionViewCellFour", bundle: nil), forCellWithReuseIdentifier: "cellFour")
        myCollectionView.register(UINib(nibName: "CollectionViewCellFive", bundle: nil), forCellWithReuseIdentifier: "cellFive")
    }
    
    func setUpCollectionView(){
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension TableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch myCollectionView.tag{
        case IntegerConstants.zero.rawValue :
            return listOfItems?.count ?? IntegerConstants.zero.rawValue
        case IntegerConstants.one.rawValue :
            return listOfItemsForCellTwo?.count ?? IntegerConstants.zero.rawValue
        case IntegerConstants.two.rawValue :
            return listOfItemsForCellThree?.count ?? IntegerConstants.zero.rawValue
        case IntegerConstants.three.rawValue :
            return listOfItemsForCellFour?.count ?? IntegerConstants.zero.rawValue
        case IntegerConstants.four.rawValue :
            return listOfItemsForCellFive?.count ?? IntegerConstants.zero.rawValue
        default :
            return IntegerConstants.zero.rawValue
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch myCollectionView.tag{
        case IntegerConstants.zero.rawValue :
            let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as! CollectionViewCellOne
            cell.labelOne.text = listOfItems?[indexPath.row].labelOne
            cell.labelOne.textColor = .tintColor
            cell.labelTwo.text = listOfItems?[indexPath.row].labelTwo
            cell.labelThree.text = listOfItems?[indexPath.row].labelThree
            cell.nameOfApp.text = listOfItems?[indexPath.row].labelFour
            cell.smallDescription.text = listOfItems?[indexPath.row].labelFive
            cell.largeImage.image = UIImage(named: listOfItems?[indexPath.row].largeImage ?? "defaultImage")
            cell.largeImage.layer.cornerRadius = cell.largeImage.frame.height/CGFloat(IntegerConstants.thirty.rawValue)
            cell.iconImage.image = UIImage(named: listOfItems?[indexPath.row].iconImage ?? "defaultImage")
            return cell
            
        case IntegerConstants.one.rawValue :
            let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath) as! CollectionViewCellTwo
            cell.labelOne.text = listOfItemsForCellTwo?[indexPath.row].labelOne
            cell.labelTwo.text = listOfItemsForCellTwo?[indexPath.row].labeTwo
            cell.labelThree.text = listOfItemsForCellTwo?[indexPath.row].lableThree
            cell.labelFour.text = listOfItemsForCellTwo?[indexPath.row].lableFour
            cell.labelFive.text = listOfItemsForCellTwo?[indexPath.row].lableFive
            cell.labelSix.text = listOfItemsForCellTwo?[indexPath.row].lableSix
            cell.imageOne.image = UIImage(named: listOfItemsForCellTwo?[indexPath.row].iconImageOne ?? "defaultImage")
            cell.imageTwo.image = UIImage(named: listOfItemsForCellTwo?[indexPath.row].iconImageTwo ?? "defaultImage")
            cell.imageThree.image = UIImage(named: listOfItemsForCellTwo?[indexPath.row].iconImageThree ?? "defaultImage")
            cell.imageOne.layer.cornerRadius = cell.imageOne.frame.height/CGFloat(IntegerConstants.five.rawValue)
            cell.imageTwo.layer.cornerRadius = cell.imageTwo.frame.height/CGFloat(IntegerConstants.five.rawValue)
            cell.imageThree.layer.cornerRadius = cell.imageThree.frame.height/CGFloat(IntegerConstants.five.rawValue)
            return cell
            
        case IntegerConstants.two.rawValue :
            let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cellThree", for: indexPath) as! CollectionViewCellThree
            cell.labelOne.text = listOfItemsForCellThree?[indexPath.row].labelOne
            cell.labelTwo.text = listOfItemsForCellThree?[indexPath.row].labelTwo
            cell.labelThree.text = listOfItemsForCellThree?[indexPath.row].labelThree
            cell.labelFour.text = listOfItemsForCellThree?[indexPath.row].labelFour
            cell.labelFive.text = listOfItemsForCellThree?[indexPath.row].labelFive
            cell.imageOne.image = UIImage(named: listOfItemsForCellThree?[indexPath.row].largeImage ?? "defaultImage")
            cell.imageTwo.image = UIImage(named: listOfItemsForCellThree?[indexPath.row].imageIcon ?? "defaultImage")
            cell.imageOne.layer.cornerRadius = cell.imageOne.frame.height/CGFloat(IntegerConstants.twentyFive.rawValue)
            cell.imageTwo.layer.cornerRadius = cell.imageTwo.frame.height/CGFloat(IntegerConstants.five.rawValue)
            return cell
            
        case IntegerConstants.three.rawValue :
            let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cellFour", for: indexPath) as! CollectionViewCellFour
            cell.labelOne.text = listOfItemsForCellFour?[indexPath.row].labelOne
            cell.labelTwo.text = listOfItemsForCellFour?[indexPath.row].labelTwo
            cell.labelThree.text = listOfItemsForCellFour?[indexPath.row].labelThree
            cell.image.image = UIImage(named: listOfItemsForCellFour?[indexPath.row].image ?? "defaultImage")
            return cell
            
        case IntegerConstants.four.rawValue :
            let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cellFive", for: indexPath) as! CollectionViewCellFive
            cell.labelOne.text = listOfItemsForCellFive?[indexPath.row].labelOne
            cell.labelTwo.text = listOfItemsForCellFive?[indexPath.row].labelTwo
            cell.labelThree.text = listOfItemsForCellFive?[indexPath.row].labelThree
            cell.labelFour.text = listOfItemsForCellFive?[indexPath.row].labelFour
            cell.imageOne.image = UIImage(named: listOfItemsForCellFive?[indexPath.row].imageOne ?? "defaultImage")
            cell.imageTwo.image = UIImage(named: listOfItemsForCellFive?[indexPath.row].imageTwo ?? "defaultImage")
            cell.imageOne.layer.cornerRadius = cell.imageOne.frame.height/CGFloat(IntegerConstants.five.rawValue)
            cell.imageTwo.layer.cornerRadius = cell.imageTwo.frame.height/CGFloat(IntegerConstants.five.rawValue)
            return cell
            
        default :
            let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCellOne
            return cell
        }
    }
}


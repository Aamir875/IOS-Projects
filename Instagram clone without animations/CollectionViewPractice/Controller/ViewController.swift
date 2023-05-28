//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by Aamir khan on 04/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var upperCollectionView: UICollectionView!
    @IBOutlet weak var lowerCollectionView: UICollectionView!
    
    var itemsInUpper = [UpperCollectionViewModel]()
    var itemsInLower = [LowerCollectionViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsInUpper = UpperCollectionViewData.getAllDataForUpperView()
        itemsInLower = LowerCollectionViewData.getAllDataForLowerView()
        // Do any additional setup after loading the view.
    }
}

extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.upperCollectionView{
            return itemsInUpper.count
        }
        else{
            return itemsInLower.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.upperCollectionView{
            let Cell = UpperCollectionViewCell.assignDataToCell(Cell: upperCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpperCollectionViewCell, itemsInUpper : itemsInUpper, index : indexPath)
            return Cell
        }
        else
        {
            if collectionView == self.lowerCollectionView{
                let Cell2 = LowerCollectionViewCell.assignDataToCell(Cell:lowerCollectionView.dequeueReusableCell(withReuseIdentifier: "lowerCell", for: indexPath) as! LowerCollectionViewCell, itemsInLower : itemsInLower, index: indexPath)
                return Cell2
            }
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: indexPath)
    }
}

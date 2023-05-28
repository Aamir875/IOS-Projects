//
//  ViewController.swift
//  Instagram Clone
//
//  Created by Aamir khan on 25/04/23.
//

import UIKit
import Foundation

class ViewController: UIViewController{

    var listOfImages : [String?]?
    var isButtonClicked = false
    let tabBar = UITabBarController()
    
    var myCollectionView : UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        let length = UIScreen.main.bounds.width
        var collectionView = UICollectionView(frame: CGRect(x: 0, y: 100,
                                                            width: length, height: 670), collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        UserDefaults.standard.setValue(ImageData.instance.items, forKey: "listOfImages")
        fetchImages()
        configureItemsForNavigationBar()
        setUpCollectionView()
        self.view.addSubview(myCollectionView)
        setUpDoubleTap()
    }
    
    func setUpCollectionView() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        let nibCell = UINib(nibName: "CollectionViewCell", bundle: nil)
        myCollectionView.register(nibCell, forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func fetchImages(){
        listOfImages = ImageData.instance.getItems()
    }
    
    func configureItemsForNavigationBar(){
        navigationItem.title = "Instagram"
        navigationController?.navigationBar.tintColor = .label
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont(name: "Chalkboard SE", size: 25) as Any]
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .done, target: nil, action: nil)
    }
    
    var doubleTapGesture : UITapGestureRecognizer?
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listOfImages?.count ?? 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        if let image = listOfImages?[indexPath.row] {
            cell.imageViewInCell.image = UIImage(named: image)
        }
        cell.imageViewForPerson.image = UIImage(named: "personImage")
        cell.imageViewForPerson.layer.cornerRadius = cell.imageViewForPerson.frame.height/2
        cell.imageViewInCell.isUserInteractionEnabled = true
        cell.likeDislikeButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        return cell
    }
    
    @objc func addAction(sender:UIButton){
        if isButtonClicked == true{
            sender.setImage(UIImage(named: "unfilledHeartNew2"), for: .normal)
            isButtonClicked = false
        } else {
            sender.setImage(UIImage(named: "filledHeartLarge"), for: .normal)
            isButtonClicked = true
        }
    }
    
    func setUpDoubleTap(){
        doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(didDoubleTapCollectionView))
        doubleTapGesture?.numberOfTapsRequired = 2
        myCollectionView.addGestureRecognizer(doubleTapGesture ?? UIGestureRecognizer())
        doubleTapGesture?.delaysTouchesBegan = true
    }
    @objc func didDoubleTapCollectionView(gesture : UITapGestureRecognizer){
        let pointInCollectionView = doubleTapGesture?.location(in: myCollectionView)
        if let selectedIndexPath = myCollectionView.indexPathForItem(at: pointInCollectionView!){
            let selectedCell = myCollectionView.cellForItem(at: selectedIndexPath)

            guard let gestureView = gesture.view else {return}
            
            let size = gestureView.frame.width/4
            let heart = UIImageView(image: UIImage(systemName: "heart.fill"))
            heart.frame = CGRect(x: (view.frame.size.width-size)/2, y: (view.frame.size.width-size)/2, width: size, height: size)
            heart.tintColor = .white
            gestureView.addSubview(heart)
            
            DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    heart.alpha = 0
                }, completion: {
                    done in
                    if done {
                        heart.removeFromSuperview()
                    }
                })
            } )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailViewController") as! detailViewController
        
        detailViewController.imageFromViewController = listOfImages?[indexPath.row]
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let length = UIScreen.main.bounds.width
        return CGSize(width: length, height: length + 170)
    }
}

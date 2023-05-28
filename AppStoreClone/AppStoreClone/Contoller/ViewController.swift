//
//  ViewController.swift
//  AppStoreClone
//
//  Created by Aamir khan on 28/04/23.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var myTableView : UITableView!
    let arrayOfSectionTitles = ["EveryOne's Favorite",
                                "Must-Have Apps",
                                "Events You Might Like",
                                "Popular Apps",
                                "Essential Kids' Apps"]
    let userDPImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle"))
        return imageView
    }()
    
    var lastScrollContentOffset : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpNavigationBar()
    }
 
    func setUpTableView(){
        myTableView.delegate = self
        myTableView.dataSource = self
        let nibNameOne = UINib(nibName: "TableViewCell",
                               bundle: nil)
        myTableView.register(nibNameOne,
                             forCellReuseIdentifier: "TableViewCell")
    }
    
    private func setUpNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Apps"
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(userDPImageView)
        userDPImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userDPImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                                   constant: -Const.ImageRightMargin),
            userDPImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                                    constant: -Const.ImageBottomMarginForLargeState),
            userDPImageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            userDPImageView.widthAnchor.constraint(equalTo: userDPImageView.heightAnchor)
            ])
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    //MARK:
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfSectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayOfSectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: myTableView.frame.size.width, height: myTableView.frame.size.height))

        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = arrayOfSectionTitles[section]
        title.font = UIFont.boldSystemFont(ofSize: 25)
        headerView.addSubview(title)

        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.addSubview(button)

        var headerViews = Dictionary<String, UIView>()
        headerViews["title"] = title
        headerViews["button"] = button

        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[title]-[button]-15-|", options: [], metrics: nil, views: headerViews))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[title]-|", options: [], metrics: nil, views: headerViews))
        headerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[button]-|", options: [], metrics: nil, views: headerViews))
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.myCollectionView.tag = indexPath.section
        myTableView.rowHeight = cell.myCollectionView.collectionViewLayout.collectionViewContentSize.height
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let direction = scrollView.contentOffset.y
        if lastScrollContentOffset > direction {
            UIView.animate(withDuration: 0.2, delay: 0, animations: {
                self.userDPImageView.alpha = 1
            })
        }
        
        if lastScrollContentOffset < direction{
            UIView.animate(withDuration: 0.2, delay: 0, animations: {
                self.userDPImageView.alpha = 0
            })
        }
    }
}


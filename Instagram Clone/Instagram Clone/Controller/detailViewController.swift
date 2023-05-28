//
//  detailViewController.swift
//  Instagram Clone
//
//  Created by Aamir khan on 27/04/23.
//

import UIKit

class detailViewController: UIViewController {

    var imageFromViewController : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem?.title = "Back"
        setUpImage()
    }
    
    func setUpImage(){
        let image = UIImage(named: imageFromViewController ?? "travelImage1")
        var imageView : UIImageView!
        let width = UIScreen.main.bounds.width
        imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: width, height: 660))
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        view.addSubview(imageView)
    }
}

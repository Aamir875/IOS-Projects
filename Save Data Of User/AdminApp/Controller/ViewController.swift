//
//  ViewController.swift
//  Admin App for Organisation
//
//  Created by Aamir khan on 30/03/23.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var textFromAdmin: UITextField!
    
    @IBAction func assignButton(_ sender: Any) {
        moveToSecondPage()        
    }
    
    // Mark : Moves Admin from first page to second.
    func moveToSecondPage(){
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {return}
        let inputValue = textFromAdmin.text
        secondViewController.idFromFirst = Int(inputValue ?? "Not available")
        textFromAdmin.text = ""
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @IBAction func seeMemberDetails(_ sender: Any) {
        moveToThird()
    }
    
    // Mark : Moves Admin to page where List of members is present.
    func moveToThird(){
        guard let thirdViewControllerNew = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else {return}
        self.navigationController?.pushViewController(thirdViewControllerNew, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

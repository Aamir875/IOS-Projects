//
//  SecondViewController.swift
//  Admin App for Organisation
//
//  Created by Aamir khan on 30/03/23.
//

import UIKit

class SecondViewController: UIViewController {

    var idFromFirst : Int?
    
    @IBOutlet weak var fullNameFromUser: UITextField!
    
    @IBOutlet weak var numberFromUser: UITextField!
    
    @IBOutlet weak var emailFromUser: UITextField!
    
    @IBOutlet weak var addressFromUser: UITextField!
    
    @IBOutlet weak var desigFromUser: UITextField!
    
    @IBOutlet weak var alternateNumberFromUser: UITextField!
    
    @IBOutlet weak var bloodGroupFromUser: UITextField!
    
    @IBAction func saveDetails(_ sender: Any) {
        saveDetailsToTableView()
    }
    
    // Mark : Save final  Details to table View.
    func saveDetailsToTableView(){
        let employeeData = EmployeeData(id: idFromFirst ?? 0, name: fullNameFromUser.text ?? "Not available", contactNumber: Int64(numberFromUser.text ?? "Not Avalable") ?? 0, email: emailFromUser.text ?? "NA", address: addressFromUser.text ?? "NA", designation: desigFromUser.text ?? "NA", alternateNumber: Int64(alternateNumberFromUser.text ?? "Not Available") ?? 0, bloodGroup: bloodGroupFromUser.text ?? "NA")
        
        fullNameFromUser.text = ""
        numberFromUser.text = ""
        emailFromUser.text = ""
        addressFromUser.text = ""
        desigFromUser.text = ""
        alternateNumberFromUser.text = ""
        bloodGroupFromUser.text = ""
        
        AllEmployeeData.instance.addItem(item: employeeData)
        guard let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as? ThirdViewController else {return}
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

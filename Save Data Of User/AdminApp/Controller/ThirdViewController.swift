//
//  ThirdViewController.swift
//  Admin App for Organisation
//
//  Created by Aamir khan on 31/03/23.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var myTable: UITableView!
    
     var listOfEmployee = [EmployeeData]()
     var idFromSecond : Int?
     var nameFromSecond : String?
     var numberFromSecond : Int64?
     var emailFromSecond : String?
     var addressFromSecond : String?
     var designationFromSecond : String?
     var alternateNumberfromSecond : Int64?
     var bloodGroupFromSecond : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listOfEmployee = AllEmployeeData.instance.getItemList()
        myTable.reloadData()
    }
}

extension ThirdViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfEmployee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let Cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell else {return UITableViewCell(style: .default, reuseIdentifier: "Cell")}
        
        let theValue = listOfEmployee[indexPath.row].id
        Cell.idLabel.text = "\(theValue)"
        Cell.fullNameLabel.text = listOfEmployee[indexPath.row].name
        let thevalue2 = listOfEmployee[indexPath.row].contactNumber
        Cell.contactNumberLabel.text = "\(thevalue2)"
        Cell.emailLabel.text = listOfEmployee[indexPath.row].email
        Cell.addressLabel.text = listOfEmployee[indexPath.row].address
        Cell.designationLabel.text = listOfEmployee[indexPath.row].designation
        let theValue3 = listOfEmployee[indexPath.row].alternateNumber
        Cell.alternateLabel.text = "\(theValue3)"
        Cell.bloodGroupLabel.text = listOfEmployee[indexPath.row].bloodGroup
        
        return Cell
    }
}

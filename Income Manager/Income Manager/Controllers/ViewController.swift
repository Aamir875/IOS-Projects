//
//  ViewController.swift
//  Income Manager
//
//  Created by Aamir khan on 11/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var greenArrow: UIImageView!
    @IBOutlet weak var redArrow: UIImageView!
    @IBOutlet weak var tableViewForExpenses: UITableView!
    
    var spacing = GeneralValues.Spacing.rawValue
    var arrayOfExpenseTypes : [ExpenseDataModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        addingDataInArrayOfExpenses()
        makeImageCircular()
    }
    
    func addingDataInArrayOfExpenses(){
        arrayOfExpenseTypes = ExpenseData.instance.getItems()
    }
    
    //MARK: - This makes the upper two buttons circular.
    func makeImageCircular(){
        greenArrow.layer.cornerRadius = greenArrow.frame.size.width/CGFloat(GeneralIntergerValues.two.rawValue)
        redArrow.layer.cornerRadius = redArrow.frame.size.width/CGFloat(GeneralIntergerValues.two.rawValue)
    }
}

//MARK: - To use built-in function through which data will be inserted in tableView Sections.
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    //MARK: - Provides number of section.
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfExpenseTypes?.count ?? GeneralIntergerValues.zero.rawValue
    }
    
    //MARK: - provides number of cell.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GeneralIntergerValues.one.rawValue
    }
    
    //MARK: - Configure data values in cell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let Cell = tableViewForExpenses.dequeueReusableCell(withIdentifier: "cell") as? TableViewCellExpenseData else {return UITableViewCell(style: .default, reuseIdentifier: "cell")}
        return TableViewCellExpenseData.addDataToCell(Cell: Cell,arrayOfExpenseTypes : arrayOfExpenseTypes ?? ExpenseData.instance.getItemsDefault(), indexPath: indexPath)
        
    }
    
    //MARK: - provides height for footer in section.
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return (spacing/GeneralValues.divideSpacing.rawValue)
    }
}

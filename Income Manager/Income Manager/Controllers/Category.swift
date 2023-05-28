//
//  Category.swift
//  Income Manager
//
//  Created by Aamir khan on 12/04/23.
//

import UIKit

class Category: UIViewController {

    @IBOutlet weak var tableForCategory: UITableView!
    @IBOutlet weak var mySearchText: UISearchBar!
    
    var arrayOfCategory : [CategoryModel]?
    var searching = false
    var searchArray : [CategoryModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addingDataInArrayOfCategory()
        customizeSearchBar()
    }
    func customizeSearchBar(){
        mySearchText.layer.borderWidth = CGFloat(GeneralIntergerValues.one.rawValue)
        mySearchText.layer.cornerRadius = CGFloat(GeneralIntergerValues.thirty.rawValue)
        mySearchText.layer.masksToBounds = true
        mySearchText.searchTextField.layer.cornerRadius = CGFloat(GeneralIntergerValues.twenty.rawValue)
        mySearchText.searchTextField.layer.masksToBounds = true
    }
    
    func addingDataInArrayOfCategory(){
        arrayOfCategory = CategoryData.instance.getItems()
    }
}

extension Category : UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    
    //MARK: - Provides height of cell.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(GeneralIntergerValues.sixty.rawValue)
    }
    
    //MARK: - Provides number total number of sections in tableView.
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return (searching ? searchArray?.count : arrayOfCategory?.count) ?? GeneralIntergerValues.zero.rawValue
       
    }
    
    //MARK: - Provides name of section.
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return searching ? searchArray?[section].headerName : arrayOfCategory?[section].headerName
        
    }
    
    //MARK: - Provides number of rows in section.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return (searching ? searchArray?[section].categoryName.count : arrayOfCategory?[section].categoryName.count) ?? 0
        
    }
    
    //MARK: - To Create cell and feed data in them.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let Cell = tableForCategory.dequeueReusableCell(withIdentifier: "cellForCategory") as? tableViewCellForCategoryTableViewCell else {return UITableViewCell(style: .default, reuseIdentifier: "cellForCategory")}
        
        return tableViewCellForCategoryTableViewCell.addDataToCell(Cell: Cell, indexPath: indexPath, searching: searching, searchArray: searchArray ?? CategoryData.instance.getItemsDefault(), arrayOfCategory: arrayOfCategory ?? CategoryData.instance.getItemsDefault())
       
    }
    
    //MARK: - Searching category names from all categories.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchArray = []
        searching = true
        for counter in GeneralIntergerValues.zero.rawValue..<(arrayOfCategory?.count ?? GeneralIntergerValues.zero.rawValue){
            
            for categoryNameForSearch in arrayOfCategory?[counter].categoryName ?? []{
                
                if mySearchText.text == ""{
                    searchArray = arrayOfCategory
                } else {
                    if categoryNameForSearch.lowercased().contains(mySearchText.text?.lowercased() ?? "Invalid Value"){
                        searchArray?.append(arrayOfCategory?[counter] ?? CategoryData.instance.getItemsDefault()[GeneralIntergerValues.zero.rawValue])
                    }
                }
                tableForCategory.reloadData()
            }
        }
    }
}

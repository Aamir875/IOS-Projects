//
//  AllEmployeeData.swift
//  Admin App for Organisation
//
//  Created by Aamir khan on 31/03/23.
//

import Foundation
import UIKit

class AllEmployeeData{
    static var instance = AllEmployeeData()
    var items = [EmployeeData]()
    
    func addItem(item: EmployeeData){
        self.items.append(item)
    }
    
    func getItemList() -> [EmployeeData]{
        return self.items
    }
}

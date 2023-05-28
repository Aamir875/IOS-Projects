//
//  ExpenseData.swift
//  Income Manager
//
//  Created by Aamir khan on 12/04/23.
//

import Foundation

class ExpenseDataModel{
    
    var imageInCell :String
    var typeExpense : String
    var timeOfExpense : String
    var amount : String
    
    init(imageInCell: String, typeExpense: String, timeOfExpense: String, amount: String) {
        self.imageInCell = imageInCell
        self.typeExpense = typeExpense
        self.timeOfExpense = timeOfExpense
        self.amount = amount
    }
}

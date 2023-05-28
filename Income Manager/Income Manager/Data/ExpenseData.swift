//
//  ExpenseData.swift
//  Income Manager
//
//  Created by Aamir khan on 12/04/23.
//
//MARK: - Another class for hardcoded values.
import Foundation

class ExpenseData{
    static var instance = ExpenseData()
    var items = [ExpenseDataModel(imageInCell: HardCodedValuesForExpenseData.imageInCellOne.rawValue,
                                  typeExpense: HardCodedValuesForExpenseData.typeExpensOne.rawValue,
                                  timeOfExpense: HardCodedValuesForExpenseData.timeOffExpenseOne.rawValue,
                                  amount: HardCodedValuesForExpenseData.amountOne.rawValue),
                 ExpenseDataModel(imageInCell: HardCodedValuesForExpenseData.imageInCellTwo.rawValue, typeExpense: HardCodedValuesForExpenseData.typeExpensTwo.rawValue, timeOfExpense: HardCodedValuesForExpenseData.timeOffExpenseTwo.rawValue, amount: HardCodedValuesForExpenseData.amountTwo.rawValue),ExpenseDataModel(imageInCell: HardCodedValuesForExpenseData.imageInCellThree.rawValue, typeExpense: HardCodedValuesForExpenseData.typeExpenseThree.rawValue, timeOfExpense: HardCodedValuesForExpenseData.timeOffExpenseThree.rawValue, amount: HardCodedValuesForExpenseData.amountThree.rawValue),ExpenseDataModel(imageInCell: HardCodedValuesForExpenseData.imageInCellFour.rawValue, typeExpense: HardCodedValuesForExpenseData.typeExpensFour.rawValue, timeOfExpense: HardCodedValuesForExpenseData.timeOffExpenseFour.rawValue, amount: HardCodedValuesForExpenseData.amountFour.rawValue),ExpenseDataModel(imageInCell: HardCodedValuesForExpenseData.imageInCellFive.rawValue, typeExpense: HardCodedValuesForExpenseData.timeOffExpenseFive.rawValue, timeOfExpense: HardCodedValuesForExpenseData.timeOffExpenseFive.rawValue, amount: HardCodedValuesForExpenseData.amountFive.rawValue)]
    
    var sampleItem = [ExpenseDataModel(imageInCell: HardCodedValuesForExpenseData.imageInCellSix.rawValue,
                                       typeExpense: HardCodedValuesForExpenseData.typeExpensSix.rawValue,
                                       timeOfExpense: HardCodedValuesForExpenseData.timeOffExpenseSix.rawValue,
                                       amount: HardCodedValuesForExpenseData.amountSix.rawValue)]
    
    //MARK: - Return data values.
    func getItems()->[ExpenseDataModel]{
        return self.items
    }
    
    //MARK: - return default values.
    func getItemsDefault()->[ExpenseDataModel]{
        return self.sampleItem
    }
    
    //MARK: - Add new data in object.
    func addItems(newItem : ExpenseDataModel){
        self.items.append(newItem)
    }
}


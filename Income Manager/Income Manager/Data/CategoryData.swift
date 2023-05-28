//
//  CategoryData.swift
//  Income Manager
//
//  Created by Aamir khan on 12/04/23.
//

//MARK: - Another class for hardcoded values using enum.

import Foundation

class CategoryData{
    
    static var instance  = CategoryData()
    var item = [CategoryModel(headerName:HardCodedValuesForCategoryData.headerNameForfirstSection.rawValue,
                              imageForCategory:[HardCodedValuesForCategoryData.imageNameOne.rawValue,
                                                HardCodedValuesForCategoryData.imageNameTwo.rawValue,
                                                HardCodedValuesForCategoryData.imageNameThree.rawValue,
                                                HardCodedValuesForCategoryData.imageNameFour.rawValue,
                                                HardCodedValuesForCategoryData.imageNameFive.rawValue],
                              categoryName: [HardCodedValuesForCategoryData.categoryNameOne.rawValue,
                                             HardCodedValuesForCategoryData.categoryNameTwo.rawValue,
                                             HardCodedValuesForCategoryData.categoryNameThree.rawValue,
                                             HardCodedValuesForCategoryData.categoryNameFour.rawValue,
                                             HardCodedValuesForCategoryData.categoryNameFive.rawValue]),
                CategoryModel(headerName: HardCodedValuesForCategoryData.headerNameForSecondSection.rawValue,
                              imageForCategory: [HardCodedValuesForCategoryData.imageNameSix.rawValue,
                                                 HardCodedValuesForCategoryData.imageNameSeven.rawValue],
                              categoryName: [HardCodedValuesForCategoryData.categoryNameSix.rawValue,
                                             HardCodedValuesForCategoryData.categoryNameSeven.rawValue])]
    
    var sampleItem = [CategoryModel(headerName: HardCodedValuesForCategoryData.headerNameForDefaultSection.rawValue,
                                    imageForCategory: [HardCodedValuesForCategoryData.imageNameDefault.rawValue],
                                    categoryName: [HardCodedValuesForCategoryData.categoryNameDefault.rawValue])]
    
    //MARK: - Return dara items for CategoryModel class.
    func getItems()->[CategoryModel]
    {
        return self.item
    }
    
    //MARK: - Return default values.
    func getItemsDefault()->[CategoryModel]{
        return self.sampleItem
    }
    
    //MARK: - Add new data items.
    func addItems(value : CategoryModel){
        self.item.append(value)
    }
}

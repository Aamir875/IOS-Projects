//
//  categoryModel.swift
//  Income Manager
//
//  Created by Aamir khan on 12/04/23.
//

import Foundation

class CategoryModel{
    
    var headerName : String
    var imageForCategory : [String]
    var categoryName : [String]
    
    init(headerName : String, imageForCategory : [String], categoryName : [String]){
        self.headerName = headerName
        self.imageForCategory = imageForCategory
        self.categoryName = categoryName
    }
}

//
//  UpperCollectionViewModel.swift
//  CollectionViewPractice
//
//  Created by Aamir khan on 04/04/23.
//

import Foundation
import UIKit

class UpperCollectionViewData{
    
    static func getAllDataForUpperView() -> [UpperCollectionViewModel]{
        var itemsInUpper = [UpperCollectionViewModel]()
        itemsInUpper = [UpperCollectionViewModel(imageInLabel: "SmilingPerson1", textInLabel: "Smith"),
                        UpperCollectionViewModel(imageInLabel: "SmilingPerson2", textInLabel: "John"),
                        UpperCollectionViewModel(imageInLabel: "SmilingPerson3", textInLabel: "Lara"),
                        UpperCollectionViewModel(imageInLabel: "SmilingPerson4", textInLabel: "Kat")]
        return itemsInUpper
    }
}

class LowerCollectionViewData{
    static func getAllDataForLowerView()->[LowerCollectionViewModel]{
        var itemsInLower = [LowerCollectionViewModel]()
        itemsInLower = [LowerCollectionViewModel(imageInLabelSmall: "SmilingPerson1", imageInLabelLarge: "LowerImage1", textInLabel: "Smith"),
        LowerCollectionViewModel(imageInLabelSmall: "SmilingPerson2", imageInLabelLarge: "LowerImage2", textInLabel: "John"),
        LowerCollectionViewModel(imageInLabelSmall: "SmilingPerson3", imageInLabelLarge: "LowerImage3", textInLabel: "Lara"),
        LowerCollectionViewModel(imageInLabelSmall: "SmilingPerson4", imageInLabelLarge: "LowerImage4", textInLabel: "kat")]
        return itemsInLower
    }
}

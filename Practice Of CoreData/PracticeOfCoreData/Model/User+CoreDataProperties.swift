//
//  User+CoreDataProperties.swift
//  PracticeOfCoreData
//
//  Created by Aamir khan on 17/04/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var states: State?

}

extension User : Identifiable {

}

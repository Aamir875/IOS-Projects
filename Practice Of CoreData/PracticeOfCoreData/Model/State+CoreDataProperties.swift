//
//  State+CoreDataProperties.swift
//  PracticeOfCoreData
//
//  Created by Aamir khan on 17/04/23.
//
//

import Foundation
import CoreData


extension State {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<State> {
        return NSFetchRequest<State>(entityName: "State")
    }

    @NSManaged public var stateName: String?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension State {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: User)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: User)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension State : Identifiable {

}

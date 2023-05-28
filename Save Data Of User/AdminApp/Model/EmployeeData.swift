//
//  EmployeeData.swift
//  Admin App for Organisation
//
//  Created by Aamir khan on 30/03/23.
//

import Foundation

class EmployeeData{
    var id : Int
    var name : String
    var contactNumber : Int64
    var email : String
    var address : String
    var designation : String
    var alternateNumber : Int64
    var bloodGroup : String
    
    init(id: Int, name: String, contactNumber: Int64, email: String, address: String, designation: String, alternateNumber: Int64, bloodGroup: String) {
        self.id = id
        self.name = name
        self.contactNumber = contactNumber
        self.email = email
        self.address = address
        self.designation = designation
        self.alternateNumber = alternateNumber
        self.bloodGroup = bloodGroup
    }
}

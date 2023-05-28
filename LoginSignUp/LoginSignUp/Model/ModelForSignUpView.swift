//
//  ModelForSignUpView.swift
//  LoginSignUp
//
//  Created by Aamir khan on 05/05/23.
//

import Foundation

class ModelForSignUpView : Codable{
    var userName : String
    var contactNumber : String
    var email : String
    var password : String
    
    init(userName: String, contactNumber: String, email: String, password: String){
        self.userName = userName
        self.contactNumber = contactNumber
        self.email = email
        self.password = password
    }
}

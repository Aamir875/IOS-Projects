//
//  SignUpViewModel.swift
//  LoginSignUp
//
//  Created by Aamir khan on 07/05/23.
//

import Foundation

class SignUpViewModel : ObservableObject{
    
    @Published var email = StringConstants.emptyString.rawValue
    @Published var password  = StringConstants.emptyString.rawValue
    @Published var userName = StringConstants.emptyString.rawValue
    @Published var contactNumber = StringConstants.emptyString.rawValue
    @Published var confirmPassword = StringConstants.emptyString.rawValue
    
    //MARK: To match password and confirm password.
    func passwordsMatch()->Bool{
        password == confirmPassword
    }
    
    //MARK: To validate name
    func isNameValid()->Bool{
        //NSPredicate is a foundation class that specifies how data should be fetched or filterd.
        let nameText = NSPredicate(format: StringConstants.selfMatches.rawValue,
                                   StringConstants.nameRegex.rawValue)
        
        return nameText.evaluate(with: userName)
    }
    
    //MARK: To validate password.
    func isPasswordValid()->Bool{
        let passwordText = NSPredicate(format: StringConstants.selfMatches.rawValue,
                                       StringConstants.passwordRegex.rawValue)
        
        return passwordText.evaluate(with: password)
    }
    
    //MARK: Function to Validate email.
    func isEmailValid()->Bool{
        let emailText = NSPredicate(format: StringConstants.selfMatches.rawValue,
                                    StringConstants.emailRegex.rawValue)
        
        return emailText.evaluate(with: email)
    }
    
    //MARK: Function to validate number.
    func isNumberValid()->Bool{
        let number = NSPredicate(format: StringConstants.selfMatches.rawValue,
                                 StringConstants.numberRegex.rawValue)
        
        return number.evaluate(with: contactNumber)
    }
    
    //MARK: To Validate all fields.
    func isSignupCompleted()->Bool{
        if !passwordsMatch() ||
            !isPasswordValid() ||
            !isEmailValid() ||
            !isNameValid() ||
            !isNumberValid(){
            return false
        }
        return true
    }
    
    //MARK: Confirm password prompt.
    var confirmPasswordPromt : String{
        if passwordsMatch(){
            return StringConstants.emptyString.rawValue
        }
        else{
            return StringConstants.passwordMatch.rawValue
        }
    }
    
    //MARK: Prompt For password.
    var passwordPromt : String{
        if isPasswordValid(){
            return StringConstants.emptyString.rawValue
        }
        else{
            return StringConstants.enterValidPassword.rawValue
        }
    }
    
    //MARK: Prompt for email.
    var emailPromt : String{
        if isEmailValid(){
            return StringConstants.emptyString.rawValue
        }
        else{
            return StringConstants.enterValidMail.rawValue
        }
    }
    
    //MARK: Prompt for contact number.
    var contactNumberPromt : String{
        if isNumberValid(){
            return StringConstants.emptyString.rawValue
        }
        else{
            return StringConstants.enterValidContact.rawValue
        }
    }

    //MARK: Prompt for name.
    var namePromt : String{
        if isNameValid(){
            return StringConstants.emptyString.rawValue
        }
        else{
            return StringConstants.enterValidName.rawValue
        }
    }
    
    //MARK: To make all values blank when user return to sign up page.
    func signup(){
        email = StringConstants.emptyString.rawValue
        password  = StringConstants.emptyString.rawValue
        userName = StringConstants.emptyString.rawValue
        contactNumber = StringConstants.emptyString.rawValue
        confirmPassword = StringConstants.emptyString.rawValue
    }
}

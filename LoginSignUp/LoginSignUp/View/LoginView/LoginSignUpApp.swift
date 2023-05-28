//
//  LoginSignUpApp.swift
//  LoginSignUp
//
//  Created by Aamir khan on 04/05/23.
//

import SwiftUI
@main
struct LoginSignUpApp: App {
    
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: StringConstants.isRoot.rawValue) == false {
                ContentView()
            }
            else
            {
                UserDetailView(userName: .constant(StringConstants.userName.rawValue),
                               contactNumber: .constant(StringConstants.userNumber.rawValue),
                               email: .constant(StringConstants.userID.rawValue),
                               password: .constant(StringConstants.userPassword.rawValue))
            }
        }
    }
}

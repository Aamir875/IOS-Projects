//
//  ForgotPasswordView.swift
//  LoginSignUp
//
//  Created by Aamir khan on 08/05/23.
//

import SwiftUI

//MARK: View to handle the case when user forgots his password.
struct ForgotPasswordView: View {
    
    @State private var email = StringConstants.emptyString.rawValue
    @State private var isActive = false
    var body: some View {
            VStack(content: {
                ImageForTopView()
                
                Spacer()
                
                HeadingView(headingValue: StringConstants.forgotPassword.rawValue)
                
                HeadingAndTextField(PlaceHolderForTextField: StringConstants.placeHolderForEmail.rawValue,
                                    headingOfTextField: StringConstants.email.rawValue,
                                    prompt: StringConstants.emptyString.rawValue,
                                    textFieldValueFromUser: $email)
                
                ButtonView(buttonText: StringConstants.submit.rawValue)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            })
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

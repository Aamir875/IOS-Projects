//
//  HeadingAndTextField.swift
//  LoginSignUp
//
//  Created by Aamir khan on 04/05/23.
//

import SwiftUI

//MARK: Reusable component used in different views for getting input from user.
struct HeadingAndTextField: View {
    var PlaceHolderForTextField : String
    var headingOfTextField : String
    var prompt : String
    @Binding var textFieldValueFromUser : String
    
    var body: some View {
        
        VStack(alignment: .leading,spacing:CGFloat(IntegerConstants.minusTwenty.rawValue),
               content: {
            Text(headingOfTextField)
                .padding()
                .font(.title2)
                .bold()
            
            VStack(alignment: .leading,
                   spacing : CGFloat(IntegerConstants.five.rawValue),
                   content: {
                
                TextField(PlaceHolderForTextField,
                          text: $textFieldValueFromUser)
                
                Rectangle()
                    .frame(height: CGFloat(IntegerConstants.one.rawValue))
                    .background(.gray)
            }).padding()
            
            Text(prompt)
                .padding()
                .fixedSize(horizontal: false,
                           vertical: true)
                .font(.body)
        })
    }
}

struct HeadingAndTextField_Previews: PreviewProvider {
    static var previews: some View {
        HeadingAndTextField(PlaceHolderForTextField: StringConstants.placeHolder.rawValue,
                            headingOfTextField: StringConstants.defaultValue.rawValue,
                            prompt: StringConstants.defaultValue.rawValue,
                            textFieldValueFromUser: .constant(StringConstants.emptyString.rawValue))
    }
}

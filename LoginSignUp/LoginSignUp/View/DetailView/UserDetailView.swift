//
//  UserDetailView.swift
//  LoginSignUp
//
//  Created by Aamir khan on 07/05/23.
//

import SwiftUI

struct UserDetailView: View {
    
    @Binding var userName : String
    @Binding var contactNumber : String
    @Binding var email : String
    @Binding var password : String
    
    let url1 = URL(string: StringConstants.imageUrlForDetailView.rawValue)
    
    var body: some View {
        VStack(content: {
            
            ImageForTopView()

            Spacer()
            
            Text(StringConstants.yourDetails.rawValue)
                .bold()
                .font(.largeTitle)
                .padding()
            
            AsyncImage(url: url1,
                       content: {
                image in
                image.resizable()
                    .frame(width:CGFloat(IntegerConstants.oneHunderdFifty.rawValue),height: CGFloat( IntegerConstants.oneHunderdFifty.rawValue))
                    .scaledToFill()
                    .clipShape(Circle())},
                       placeholder: {ProgressView()})
            .padding()
            
            VStack(alignment: .leading,content:{
                TextForDetailView(textForDetail: StringConstants.name.rawValue,
                                  detailValue: $userName)
            
                TextForDetailView(textForDetail: StringConstants.contactNo.rawValue,
                                  detailValue: $contactNumber)
                
                TextForDetailView(textForDetail: StringConstants.email.rawValue,
                                  detailValue: $email)
                
                TextForDetailView(textForDetail: StringConstants.password.rawValue,
                                  detailValue: $password)
                
                Spacer()
                Spacer()
            })
        })
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(userName: .constant(StringConstants.noName.rawValue),
                       contactNumber: .constant(StringConstants.noNumber.rawValue),
                       email: .constant(StringConstants.noEmail.rawValue),
                       password: .constant(StringConstants.noPassword.rawValue))
    }
}

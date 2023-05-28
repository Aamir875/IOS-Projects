//
//  AfterSignUpView.swift
//  LoginSignUp
//
//  Created by Aamir khan on 06/05/23.
//

import SwiftUI

struct AfterSignUpView: View {
    var body: some View {
            VStack(content: {
                
                Image(StringConstants.thankYou.rawValue)
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width,
                           height: UIScreen.main.bounds.height/CGFloat(IntegerConstants.three.rawValue))
                    .padding()
                
                Text(StringConstants.congratsMsg.rawValue)
                NavigationLink(destination: ContentView()){
                    Text(StringConstants.goToLogin.rawValue)
                        .padding()
                }
               Spacer()
            })
    }
}

struct AfterSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AfterSignUpView()
    }
}

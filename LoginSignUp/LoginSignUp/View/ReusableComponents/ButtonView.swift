//
//  ButtonView.swift
//  LoginSignUp
//
//  Created by Aamir khan on 08/05/23.
//

import SwiftUI

struct ButtonView: View {
    
    var buttonText : String
    
    var body: some View {
        Button(){
        }label: {
            Text(buttonText)
                .foregroundColor(.white)
                .font(.title2)
                .bold()
        }.frame(width: UIScreen.main.bounds.width/DoubleConstants.onePointThreeFive.rawValue,
                height: UIScreen.main.bounds.height/CGFloat( IntegerConstants.twenty.rawValue))
            .background(.black)
            .cornerRadius(CGFloat(IntegerConstants.twentyFive.rawValue))
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: StringConstants.emptyString.rawValue)
    }
}

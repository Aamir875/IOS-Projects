//
//  HeadingView.swift
//  LoginSignUp
//
//  Created by Aamir khan on 05/05/23.
//

import SwiftUI

//MARK: Reusable text used in different views for heading.
struct HeadingView: View {
    var headingValue : String
    var body: some View {
        Text(headingValue)
            .font(.largeTitle)
            .bold()
            .padding()
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingValue: StringConstants.defaultValue.rawValue)
    }
}

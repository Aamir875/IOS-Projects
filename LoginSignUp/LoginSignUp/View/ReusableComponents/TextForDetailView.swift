//
//  textForDetailView.swift
//  LoginSignUp
//
//  Created by Aamir khan on 09/05/23.
//

import SwiftUI

struct TextForDetailView: View {
    
    var textForDetail : String
    @Binding var detailValue : String
    
    var body: some View {
        Text("\(textForDetail) : \(detailValue)")
            .font(.title2)
            .padding(CGFloat(IntegerConstants.two.rawValue))
    }
}

struct TextForDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TextForDetailView(textForDetail: StringConstants.noValue.rawValue, detailValue: .constant(StringConstants.noName.rawValue))
    }
}

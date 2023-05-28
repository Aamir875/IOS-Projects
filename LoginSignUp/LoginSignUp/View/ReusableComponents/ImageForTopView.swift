//
//  ImageForTopView.swift
//  LoginSignUp
//
//  Created by Aamir khan on 05/05/23.
//

import SwiftUI

//MARK: Reusable component of image used in different views.
struct ImageForTopView: View {
    var body: some View {
        Image(StringConstants.imageForAllViews.rawValue)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width * DoubleConstants.pointFive.rawValue,
                   height: UIScreen.main.bounds.height * DoubleConstants.pointThree.rawValue)
    }
}

struct ImageForTopView_Previews: PreviewProvider {
    static var previews: some View {
        ImageForTopView()
    }
}

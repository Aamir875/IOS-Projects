//
//  SignUpView.swift
//  LoginSignUp
//
//  Created by Aamir khan on 05/05/23.
//

import SwiftUI
import PhotosUI

struct SignUpView: View {
    
    @ObservedObject var signupVM = SignUpViewModel()
    @State private var userName = StringConstants.emptyString.rawValue
    @State private var email = StringConstants.emptyString.rawValue
    @State private var contactNumber = StringConstants.emptyString.rawValue
    @State private var password = StringConstants.emptyString.rawValue
    @State private var selectedItem: PhotosPickerItem?
    @State private var selectedPhotoData: Data?

    var body: some View {
            ScrollView(content: {
                VStack(content:{
                    ImageForTopView()
                    Spacer()
                    VStack(spacing: CGFloat(IntegerConstants.forty.rawValue),content: {
                        HStack(content: {
                            HeadingView(headingValue:StringConstants.SignUp.rawValue)
                            Spacer()
                        })
                    
                        if let selectedPhotoData,
                            let image = UIImage(data: selectedPhotoData) {
                         
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.height / CGFloat(IntegerConstants.three.rawValue),
                                       height: UIScreen.main.bounds.width/CGFloat(IntegerConstants.three.rawValue))
                                .clipShape(Circle())
                        } else {
                            Image(StringConstants.defaultCamera.rawValue)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fill)
                                                            .clipShape(Circle())
                                                            .frame(width: UIScreen.main.bounds.height / CGFloat(IntegerConstants.five.rawValue),
                                                                   height: UIScreen.main.bounds.width/CGFloat(IntegerConstants.five.rawValue))
                        }
                                        
                        PhotosPicker(selection: $selectedItem,
                                     matching: .images) {
                            Label(StringConstants.selectPhoto.rawValue,
                                  systemImage: StringConstants.photo.rawValue)
                        }
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .onChange(of: selectedItem) { newItem in
                            Task {
                                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                    selectedPhotoData = data
                                }
                            }
                        }
                        
                        VStack(content: {
                            HeadingAndTextField(PlaceHolderForTextField: StringConstants.namePlaceholder.rawValue,
                                                headingOfTextField: StringConstants.name.rawValue,
                                                prompt: signupVM.namePromt,
                                                textFieldValueFromUser: $signupVM.userName)
                            HeadingAndTextField(PlaceHolderForTextField: StringConstants.placeHolderForEmail.rawValue,
                                                headingOfTextField: StringConstants.email.rawValue,
                                                prompt: signupVM.emailPromt,
                                                textFieldValueFromUser: $signupVM.email)
                            HeadingAndTextField(PlaceHolderForTextField: StringConstants.contactNumber.rawValue,
                                                headingOfTextField: StringConstants.contactNo.rawValue,
                                                prompt: signupVM.contactNumberPromt,
                                                textFieldValueFromUser: $signupVM.contactNumber)
                            HeadingAndTextField(PlaceHolderForTextField: StringConstants.password.rawValue,
                                                headingOfTextField: StringConstants.password.rawValue,
                                                prompt: signupVM.passwordPromt,
                                                textFieldValueFromUser: $signupVM.password)
                            HeadingAndTextField(PlaceHolderForTextField: StringConstants.password.rawValue,
                                                headingOfTextField: StringConstants.confirmPassword.rawValue, prompt: signupVM.confirmPasswordPromt,
                                                textFieldValueFromUser: $signupVM.confirmPassword)
                        })
                        
                        Button(){
                            var userData = ModelForSignUpView(userName: signupVM.userName == StringConstants.emptyString.rawValue ? StringConstants.noName.rawValue : signupVM.userName,
                                                              contactNumber: signupVM.contactNumber == StringConstants.emptyString.rawValue ? StringConstants.noNumber.rawValue : signupVM.contactNumber,
                                                              email: signupVM.email == StringConstants.emptyString.rawValue ? StringConstants.noEmail.rawValue : signupVM.email,
                                                              password: signupVM.password == StringConstants.emptyString.rawValue ? StringConstants.noPassword.rawValue : signupVM.password)
                            SavingAndRetrievingData.savingData(userDataModel: userData){model in
                                userName = model.userName
                                email = model.email
                                contactNumber = model.contactNumber
                                password = model.password
                                DispatchQueue.main.async {
                                    let window = UIApplication
                                        .shared
                                        .connectedScenes  //Connected scenes are those that are in memory and potentially doing active work. A connected scene may be in the foreground or background, and it may be onscreen or offscreen.
                                        .flatMap({($0 as? UIWindowScene)?.windows ?? [] })
                                        .first(where: {$0.isKeyWindow })
                                    window!.rootViewController = UIHostingController(rootView: UserDetailView(userName: $userName, contactNumber: $contactNumber, email: $email, password: $password))
                                    window?.makeKeyAndVisible()
                                }
                            }
                            UserDefaults.standard.setValue(true, forKey: "isRoot")
                            signupVM.signup()
                        }label: {
                            Text(StringConstants.signUpTwo.rawValue)
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                        }.frame(width: UIScreen.main.bounds.width/DoubleConstants.onePointThreeFive.rawValue,
                                height: UIScreen.main.bounds.height/CGFloat(IntegerConstants.twenty.rawValue))
                            .background(.black)
                            .cornerRadius(CGFloat(IntegerConstants.twentyFive.rawValue))
                            .opacity(signupVM.isSignupCompleted() ? Double(IntegerConstants.one.rawValue): DoubleConstants.pointSix.rawValue)
                            .disabled(!signupVM.isSignupCompleted())
                    })
                })
            })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

//
//  ContentView.swift
//  LoginSignUp
//
//  Created by Aamir khan on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive = false
    @State private var isActive2 = false
    @State private var email = StringConstants.emptyString.rawValue
    @State private var password = StringConstants.emptyString.rawValue
    @State private var isSecured : Bool = true
    
    //Due to some keyword body can contain only opaque(single type) types.
    var body: some View {
        NavigationView(content: {
            ScrollView(content: {
                VStack(content: {
                    
                    ImageForTopView()
                    
                    HStack(){
                        HeadingView(headingValue: StringConstants.Login.rawValue)
                        Spacer()
                    }
                    
                    HeadingAndTextField(PlaceHolderForTextField: StringConstants.enterMailId.rawValue, headingOfTextField: StringConstants.email.rawValue, prompt: StringConstants.emptyString.rawValue, textFieldValueFromUser: $email)
                    
                    VStack(alignment: .leading,spacing: CGFloat(IntegerConstants.minusTwenty.rawValue), content: {
                        Text(StringConstants.password.rawValue)
                            .padding()
                            .font(.title2)
                            .bold()
                        
                        VStack(alignment: .leading, spacing : CGFloat(IntegerConstants.five.rawValue), content: {
                            
                            HStack(content: {
                                if isSecured{
                                    SecureField(StringConstants.password.rawValue, text: $password)
                                } else {
                                    TextField(StringConstants.password.rawValue, text: $password)
                                }
                            }).overlay(alignment: .trailing,content:{
                                Image(systemName: isSecured ? StringConstants.eyeSlash.rawValue : StringConstants.eye.rawValue)
                                    .onTapGesture {
                                        isSecured.toggle()
                                    }
                            })
                            
                            Rectangle()
                                .frame(height: CGFloat(IntegerConstants.one.rawValue))
                                .background(.gray)
                            
                            HStack(content: {
                                Spacer()
                                
                                NavigationLink(destination: ForgotPasswordView(), isActive:$isActive2){
                                    Button(){
                                        isActive2 = true
                                    } label: {
                                        Text(StringConstants.forgotPassword.rawValue)
                                            .foregroundColor(.gray)
                                    }
                                }
                            })
                        }).padding()
                    })
                    
                    NavigationLink( destination: SignUpView(), isActive: $isActive){
                        Button(){
                            self.isActive = true
                        }label: {
                            Text(StringConstants.loginTwo.rawValue)
                                .foregroundColor(.white)
                                .font(.title2)
                                .bold()
                        }.frame(width: UIScreen.main.bounds.width/DoubleConstants.onePointThreeFive.rawValue,height: UIScreen.main.bounds.height/CGFloat(IntegerConstants.twenty.rawValue))
                            .background(.black)
                            .cornerRadius(CGFloat(IntegerConstants.twentyFive.rawValue))
                    }
                    
                    HStack(content: {
                        Text(StringConstants.dontHaveAccount.rawValue)
                            .foregroundColor(.gray)
                        
                        NavigationLink(StringConstants.SignUp.rawValue, destination: SignUpView())
                    })
                    
                    HStack(content: {
                        Rectangle()
                            .frame(height: CGFloat(IntegerConstants.one.rawValue))
                            .background(.gray)
                            .padding()
                        
                        Text(StringConstants.orLoginWith.rawValue)
                            .bold()
                            .foregroundColor(.gray)
                        
                        Rectangle()
                            .frame(height: CGFloat(IntegerConstants.one.rawValue))
                            .background(.gray)
                            .padding()
                    })
                    
                    HStack(content: {
                        Button(){
                            
                        }label: {
                            Image(StringConstants.facebookImage.rawValue)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width/CGFloat(IntegerConstants.twelve.rawValue),height: UIScreen.main.bounds.width/CGFloat(IntegerConstants.twelve.rawValue))
                        }
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width/CGFloat(IntegerConstants.twenty.rawValue))
                            .foregroundColor(.white)
                        
                        Button(){
                            
                        }label: {
                            Image(StringConstants.gmailImage.rawValue)
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width/CGFloat(IntegerConstants.twelve.rawValue),height: UIScreen.main.bounds.width/CGFloat(IntegerConstants.twelve.rawValue))
                        }
                    })
                })
                .edgesIgnoringSafeArea(.top)
            })
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

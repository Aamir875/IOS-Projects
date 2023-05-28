//
//  SavingAndRetrievingUserData.swift
//  LoginSignUp
//
//  Created by Aamir khan on 05/05/23.
//

import Foundation

class SavingAndRetrievingData : Codable{
    
    //MARK: To save data using json placeholder Api.
    static func savingData(userDataModel : ModelForSignUpView,completion : @escaping (ModelForSignUpView)->Void){
        
        guard let url = URL(string: StringConstants.urlToSaveData.rawValue) else{
            print(StringConstants.invalidURL.rawValue)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = StringConstants.post.rawValue
        do{
            request.httpBody = try JSONEncoder().encode(userDataModel)
        } catch{
            print(StringConstants.unableToDecode.rawValue)
        }
        
//        An HTTP header is a field of an HTTP request or response that passes additional context and metadata about the request or response.
        request.setValue(StringConstants.typeOfDataToBeSaved.rawValue, forHTTPHeaderField: StringConstants.contectType.rawValue)
        
        var userDataFetched : ModelForSignUpView?
        let task1 = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                return
            }
            
            guard let data = data
            else{
                print(StringConstants.dataNotFound.rawValue)
                return
            }
            
            do{
                userDataFetched = try JSONDecoder().decode(ModelForSignUpView.self,
                                                           from: data)
                completion(userDataFetched ?? ModelForSignUpView(userName: StringConstants.noName.rawValue,
                                                                 contactNumber: StringConstants.noNumber.rawValue,
                                                                 email: StringConstants.noEmail.rawValue,
                                                                 password: StringConstants.noPassword.rawValue))
                
            } catch {
                print("unable to decode data \(error)")
                return
            }
        }
        task1.resume()
    }
}

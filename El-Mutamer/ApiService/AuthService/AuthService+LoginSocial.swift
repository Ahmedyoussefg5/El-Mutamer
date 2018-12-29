//
//  LoginMethods.swift
//  El Gawla
//
//  Created by Youssef on 11/29/18.
//  Copyright © 2018 ITGeeks. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension AuthService {
    
    func loginUserUsingSocial(id: String, email: String, name: String, image: String, provider: MyEnums.UserProvider, completion: @escaping (_ error: Error?, _ success: Bool, _ message: String)-> Void){
        
        guard let countryId = self.userCountryId else {
            return
        }
        
        let parameters = [
            "Data": [
                "action": "loginOrRegisterWithSocial"
            ], "Request" : [
                "provider": provider.rawValue,
                "provider_id": id,
                "provider_name": name,
                "provider_email": email,
                "provider_image": image
            ]
            ] as [String : Any]
        
        print(parameters)
        
        Alamofire.request(MainURL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { [weak self] response
                in guard let weakSelf = self else { return }
                switch response.result
                {
                case .failure(let error):
                    completion(error, false, "Server Error.")
                    print(error)
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    if let status = json["status"].bool{
                        if status {
                            if let apiToken = json["api_token"].string, let userId = json["user_id"].int {
                                weakSelf.authToken = apiToken
                                weakSelf.userId = userId
                                weakSelf.userEmail = email
                                weakSelf.userImage = image
                                weakSelf.userName = name
                                weakSelf.userProvider = provider.rawValue
                                weakSelf.isLoggedIn = true
                                completion(nil, true, "")
                                print(apiToken)
                                return
                            } else {
                                completion(nil, false, "Invaled Data.")
                                return
                            }
                        } else {
                            completion(nil, false, "Invaled Data.")
                            return
                        }
                    } else {
                        if let errors = json["errors"].string {
                            completion(nil, false, errors)
                            return
                        }
                        completion(nil, false, "Server Error")
                        return
                    }
                }
        }
    }
}





/*
 {
 "errors": [
 "The email must be a valid email address.",
 "The password must be a string."
 ],
 "status": false,
 "code": 402
 }
 ////***************************************************
 {
 "message": "You are logged in now !",
 "userData": {
 "api_token": "i2Y4UKY5anQQMhwGl78y5DGAA2CdpnpqFGoRY2rCTWr382NZPtodCjBJitqB",
 "user_id": 1,
 "email": "alaa@gmail.com",
 "image": "http://192.168.1.11/elgawla/public//uploaded/users/user_zfyxiUina6NC2018-10-28.png",
 "name": "alaa elsaid"
 },
 "status": true,
 "code": 200
 }
 */*/










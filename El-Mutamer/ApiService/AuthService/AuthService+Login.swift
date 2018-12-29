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
    
    func loginUserApi(email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ message: String)-> Void){
        
        let parameters = [
            "Data": [
                "action": "login"
            ], "Request" : [
                "email": email ,
                "password": password
            ]
            ] as [String : Any]
        
        print(parameters)
        Alamofire.request(MainURL, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil)
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
                            if let userData = json["userData"].dictionary {
                                if let apiToken = userData["api_token"]?.string, let email = userData["email"]?.string, let image = userData["image"]?.string?.filterAsURL, let name = userData["name"]?.string, let userId = userData["user_id"]?.int {
                                    weakSelf.authToken = apiToken
                                    weakSelf.userEmail = email
                                    weakSelf.userImage = image
                                    weakSelf.userName = name
                                    weakSelf.isLoggedIn = true
                                    weakSelf.userId = userId
                                    weakSelf.userProvider = "Gawla"
                                    print(apiToken)
                                    completion(nil, true, "")
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
                            let errors = json["errors"].arrayObject as? [String] ?? []
                            if !errors.isEmpty {
                                let error = errors.joined(separator: "\n")
                                completion(nil, false, error)
                                return
                            }
                            completion(nil, false, "Invaled Data.")
                            return
                        }
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










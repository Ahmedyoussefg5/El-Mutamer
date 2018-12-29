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
    
    
    
    func registerUserApi(name: String, email: String, password: String, memberShip: String, completion: @escaping (_ error: Error?, _ success: Bool, _ message: String)-> Void){
        
        guard let countryId = self.userCountryId else {
            return
        }
        
        let parameters = [
            "Data": [
                "action": "register"
            ], "Request" : [
                "name": name,
                "email": email,
                "membership": "basic",
                "password": password,
                "country_id": countryId
            ]
            ] as [String : Any]
        
        Alamofire.request(MainURL, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil)
            .responseJSON { [weak self] response
                in guard let weakSelf = self else { return }
                switch response.result
                {
                case .failure(let error):
                    completion(error, false, "Server Error."); return
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
                                    weakSelf.userProvider = MyEnums.UserProvider.gawla.rawValue
                                    weakSelf.userId = userId
                                    print(apiToken)
                                    completion(nil, true, "")
                                    return
                                } else {
                                    completion(nil, false, "Invaled Data.")
                                    return
                                }
                            } else {
                                let errors = json["errors"].arrayObject as! [String]
                                if !errors.isEmpty {
                                    let error = errors.joined(separator: "\n")
                                    completion(nil, false, error); return
                                }
                                completion(nil, false, "Invaled Data."); return
                            }
                        } else {
                            let errors = json["errors"].arrayObject as! [String]
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
 "userData": [],
 "errors": [
 "The email has already been taken."
 ],
 "status": false,
 "code": 402
 }
 ////***************************************************
 {
 "message": "User has been created successfully",
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








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
    
    
    func userProfilePictureUpload(image :UIImage ,completion: @escaping (_ error: Error?,_ status: Bool) -> Void) {
        
        guard let img =  image.kf.jpegRepresentation(compressionQuality: 0.9) else {
            completion(nil, false)
            return
        }
        let base64Str = img.base64EncodedString(options: .lineLength64Characters)
        
        guard let apiToken = AuthService.instance.authToken
            else { AuthService.instance.restartAppAndRemoveUserDefaults()
                return }
        guard let userID = AuthService.instance.userId
            else { AuthService.instance.restartAppAndRemoveUserDefaults()
                return }
        
        let parameter = [
            "Data": [
                "action": "updateUserDate"
            ],
            "Request": [
                "user_id": userID,
                "api_token": apiToken,
                "image": base64Str
            ]
            ]as [String : Any]
        
        Alamofire.request(MainURL, method: .post, parameters: parameter, encoding: URLEncoding.httpBody, headers: nil)
            .responseJSON { [weak self] response   in
                switch response.result
                {
                case .failure(let error):
                    completion(error, false)
                    print(error)
                    return
                case .success(let value):
                    let json = JSON(value)
                    print(json)
                    if let status = json["status"].bool {
                        if status {
                            guard let imageUrl = json["userData"]["image"].string?.filterAsURL else{
                                completion(nil, false)
                                return
                            }
                            self?.userImage = imageUrl
                            //self?.userImage = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Dua_Lipa-0761.jpg/800px-Dua_Lipa-0761.jpg"
                            completion(nil, true)
                        } else {
                            completion(nil, false)
                        }
                    } else {
                        completion(nil, false)
                    }
                    
                    
                    
                    
                    
                }
                
        }
    }
    
}





import Foundation

class MyEnums {
    
    enum UserProvider: String {
        case facebook
        case google
        case gawla
    }
    
    enum ParameterEnum: String {
        case getAllSalons
        case getSalonByUserID
        case getAllCountries
        
        private func getUserApiToken() -> String? {
            guard let apiToken = AuthService.instance.authToken else {
                AuthService.instance.restartAppAndRemoveUserDefaults(); return nil
            }
            return apiToken
        }
        private func getUserID() -> Int? {
            guard let userID = AuthService.instance.userId else {
                AuthService.instance.restartAppAndRemoveUserDefaults(); return nil
            }
            return userID
        }
        
        var parameters: [String : Any] {
            switch self {
            case .getAllCountries:
                let parameters = [
                    "Data": [
                        "action": self.rawValue
                    ],
                    "Request" : [
                        "api_token": "8QEqV21eAUneQcZYUmtw7yXhlzXsUuOvr6iH2qg9IBxwzYSOfiGDcd0W8vme"
                    ]
                    ] as [String : Any]
                return parameters
                
            case .getAllSalons:
                let parameters = [
                    "Data": [
                        "action": self.rawValue
                    ],
                    "Request": [
                        "user_id": getUserID() ?? 0,
                        "api_token": getUserApiToken() ?? "nil"
                    ]
                    ] as [String : Any]
                return parameters
                
            case .getSalonByUserID:
                let parameters = [
                    "Data": [
                        "action": self.rawValue
                    ],
                    "Request": [
                        "user_id": getUserID() ?? 0,
                        "api_token": getUserApiToken() ?? "nil"
                    ]
                    ] as [String : Any]
                return parameters
            }
        }
    }
}

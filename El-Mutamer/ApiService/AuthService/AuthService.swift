import Foundation
import UIKit

class AuthService {
    
    static let instance = AuthService()
    private init () { }

    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LoggedInKey)
        }
        set {
            defaults.set(newValue, forKey: LoggedInKey)
        }
    }
    
    var authToken: String? {
        get {
            if let apiToken = defaults.value(forKey: ApiTokenKey) as? String {
                return apiToken
            }
            return nil
        }
        set {
            defaults.set(newValue, forKey: ApiTokenKey)
        }
    }
    
    var userEmail: String? {
        get {
            return defaults.value(forKey: UserMailKey) as? String
        }
        set {
            defaults.set(newValue, forKey: UserMailKey)
        }
    }
    
    var userId: Int? {
        get {
            if let userID = defaults.value(forKey: UserIdKey) as? Int {
                return userID }
            return nil
        }
        set {
            defaults.set(newValue, forKey: UserIdKey)
        }
    }
    
    var userName: String? {
        get {
            return defaults.value(forKey: UserName) as? String
        }
        set {
            defaults.set(newValue, forKey: UserName)
        }
    }
    
    var userImage: String? {
        get {
            return defaults.value(forKey: UserProfileImage) as? String
        }
        set {
            defaults.set(newValue, forKey: UserProfileImage)
        }
    }
    
    // userCountry
    var userCountryUrl: String? {
        get {
            return defaults.value(forKey: UserCountry) as? String
        }
        set {
            defaults.set(newValue, forKey: UserCountry)
        }
    }
    var userCountryName: String? {
        get {
            return defaults.value(forKey: UserCountryName) as? String
        }
        set {
            defaults.set(newValue, forKey: UserCountryName)
        }
    }
    var userCountryId: Int? {
        get {
            return defaults.value(forKey: UserCountryName) as? Int
        }
        set {
            defaults.set(newValue, forKey: UserCountryName)
        }
    }
    
    var userProvider: String? {
        get {
            return defaults.value(forKey: UserProvider) as? String
        }
        set {
            defaults.set(newValue, forKey: UserProvider)
        }
    }
    
    func removeUserDefaults()  {
        isLoggedIn = false
        authToken = nil
        userEmail = nil
        userId = nil
        userName = nil
        userImage = nil
        userCountryUrl = nil
        userProvider = nil
    }
    
    func restartAppAndRemoveUserDefaults() {
        
       removeUserDefaults()
        
        DispatchQueue.main.async {
            guard let window =  UIApplication.shared.keyWindow else { fatalError() }
//            let loginVC = UIStoryboard(name: "LoginStoryboard", bundle: nil).instantiateInitialViewController()
            //self.present(navigationController, animated: true, completion: nil)
            let welcomeVC = WelcomeViewController()
            showSwipingViewController = false
            window.rootViewController = welcomeVC
            UIView.transition(with: window, duration: 1.0, options: .transitionFlipFromTop, animations: nil, completion: nil)
        }
        

        // make alert for the user
    }
    
//    func resetDefaults() {
    //print(Array(UserDefaults.standard.dictionaryRepresentation().values))
    // defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    // defaults.synchronize()
    //print("****************************************************")
    //print(Array(UserDefaults.standard.dictionaryRepresentation().values))
    
    //        let dictionary = defaults.dictionaryRepresentation()
    //        dictionary.keys.forEach { key in
    //            defaults.removeObject(forKey: key)
    //        }
//    }
}

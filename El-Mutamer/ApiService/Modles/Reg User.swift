
import Foundation

struct RegUser: Codable {
    let success: Bool
   // let message: String
    let data: UserData?
}

struct UserData: Codable {
    let token: String
    let userdata: Userdata
}

struct Userdata: Codable {
    let key: Int
    let name, email, phone: String
    let img: String
    let carrer, adress, type: String
}

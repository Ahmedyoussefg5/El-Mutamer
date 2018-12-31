// To parse the JSON, add this file to your project and do:
//
//   let conferences = try? newJSONDecoder().decode(Conferences.self, from: jsonData)

import Foundation

struct Conferences: Codable {
    let success: Bool?
    let message: String?
    let data: [Datum]?
}

struct Datum: Codable {
    let key: Int?
    let category, title, content, date: String?
    let adress, lat, lng: String?
    let youtubeID: YoutubeID?
    let mainImage: String?
    let schedules: [Schedule]?
    let images: [Image]?
    let mainSponser, sponsers: [Sponser]?
    let comments: [Comment]?
    let countLikes, countComments: Int?
    let countViews: String?
    
    enum CodingKeys: String, CodingKey {
        case key, category, title, content, date, adress, lat, lng
        case youtubeID = "youtubeId"
        case mainImage
        case schedules = "Schedules"
        case images, mainSponser, sponsers, comments, countLikes, countComments, countViews
    }
}

struct Comment: Codable {
    let name, content: String?
    let userImg: String?
}

struct Image: Codable {
    let image: String?
}

struct Sponser: Codable {
    let key: Int?
    let name: String?
    let image: String?
}

struct Schedule: Codable {
    let title, content: String?
}

enum YoutubeID: String, Codable {
    case the0ANNYEUARAk = "0aNNYEUARAk"
}


// To parse the JSON, add this file to your project and do:
//
//   let categury = try? newJSONDecoder().decode(Categury.self, from: jsonData)

import Foundation

struct SingleConferance: Codable {
    let success: Bool
    let message: String
    let data: Datum
}


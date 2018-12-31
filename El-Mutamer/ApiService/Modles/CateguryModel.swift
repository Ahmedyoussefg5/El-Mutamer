import Foundation

struct Categury: Codable {
    let success: Bool
    let message: String
    let data: [Item]
}

struct Item: Codable {
    let key: Int
    let icon, bg: String
    let name: String
}

import Foundation
import Alamofire

class GetDataFromApi {
    
    static var shared = GetDataFromApi()
    private init() {}
    
    func getDataAPI<T: Codable>(_ decoder: T.Type, url: String, complation: @escaping (_ error: String?, _ data: T?) -> Void) {
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON {
            (response) in
            switch response.result {
            case .failure(let error) :
                print("failure Getting Data To \(String(describing: T.self)) Model")
                complation(error.localizedDescription, nil)
                return
            case .success(_):
                guard let data = response.data else {
                    complation(nil, nil)
                    return
                }
                do {
                    let resulte = try? newJSONDecoder().decode(T.self, from: data)
                    complation(nil, resulte)
                    return
                }
                catch let error {
                    print("failure Getting Data To \(String(describing: T.self)) Model")
                    complation(error.localizedDescription, nil)
                    debugPrint(error)
                    return
                }
            }
        }
    }
    
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

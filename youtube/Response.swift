//
//  Response.swift
//  youtube
//
//

import Foundation

struct Response: Decodable {
    var videos:[Video]?
    
    
    
    enum CK : String, CodingKey{
        case items
        case kind
        case etag
        case pageInfo
        case error
        case code
        case errors
        case reason
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CK.self)

        self.videos = try! container.decode([Video].self, forKey: .items)
        
    }
//        let errorContainer = try! container.nestedContainer(keyedBy: CK.self, forKey: .error)
//        let code = try! errorContainer.decode(Int.self, forKey: .code)
//        print(code)
//        let errors = try! errorContainer.decode([Error].self, forKey: .errors)
        //print(errors[0].reason)
    
    
    
}

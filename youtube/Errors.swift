//
//  Errors.swift
//  youtube
//
//  Created by OSU App Center on 7/29/21.
//

import Foundation

struct Error: Decodable{
    var message = ""
    var domain = ""
    var reason = ""
    
    enum CKs:String, CodingKey {
        case message
        case domain
        case reason
            
            
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CKs.self)
        
        self.message = try container.decode(String.self, forKey: .message)
        
        self.domain = try container.decode(String.self, forKey: .domain)
        
        self.reason = try container.decode(String.self, forKey: .reason)
        
    }
    
    
}

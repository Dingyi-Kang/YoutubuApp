//
//  CacheManager.swift
//  youtube
//
//  Created by OSU App Center on 7/31/21.
//

import Foundation


class CacheManager {
    
    static var dictionary = [String:Data]()
    
    static func saveURLData(urlString: String, data: Data){
        dictionary[urlString] = data
    }
    
    
    static func getURLData(urlString: String) -> Data?{
        return dictionary[urlString]
    }
    
}

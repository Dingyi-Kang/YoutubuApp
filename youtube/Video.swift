//
//  Video.swift
//  youtube
//
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey{
        
        //match with json keys
        case snippet
        
        case published = "publishedAt"
        case title
        case description
        
        case thumbnails
        case high
        case thumbnail = "url"
        
        case resourceId
        case videoId
    }
    
    init(from decoder: Decoder) throws {
        //parse the whole passed json data from the decoder into a container using the enum keys for identification
        let itemContainer = try decoder.container(keyedBy: CodingKeys.self)
        //specify which minor container within the outter container you wanna access using the specific case key within the nume keys confirming the CodingKey protocol
        let snippetContainer = try itemContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        //parse descrip
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        //parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        //parse thumbnails
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parse videoId
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
    }
    
    
}

//
//  Constants.swift
//  youtube
//
//

import Foundation


struct Constants {
    //both api key and id are correct. somehow, the data is incorrect
    static let API_KEY = "AIzaSyDIdR8nv_QU8wdmMcGVRJH1hGEOr54OSEY"
    static let PLAYLIST_ID = "PL5Pdci3KjLN-fLNxsaqS2gQVX1zGDqu5j"
        //"PL5Pdci3KjLN9ve_HwIOmaKvMulzekUPy4"
    
    
    static let API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(PLAYLIST_ID)&key=\(API_KEY)"
    
    
    static let cellId = "cell"
    
    static let youtubeEmbedURL = "https://www.youtube.com/watch?v=_4AcjvsVn5k&list=PL5Pdci3KjLN-fLNxsaqS2gQVX1zGDqu5j&index=2"
    
}

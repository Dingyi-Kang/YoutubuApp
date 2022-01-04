//
//  Model.swift
//  youtube
//
//  Created by OSU App Center on 7/26/21.
//

import Foundation

class Model {
    
    var delegate: modelDelegate?
    
    func getVideos() {
        //create a url object
        let url = URL(string: Constants.API_URL)
        
        guard  url != nil else {
            return
        }
        
        //get a urlSession object
        let session = URLSession.shared
        
        //get a data task from urlSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                //parsing the data into video objects
                do{
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let response = try decoder.decode(Response.self, from: data!)
                    self.delegate?.passResponse(resp: response)
                }
                catch{
                   
                }
            }
        }
        
        //start the task
        dataTask.resume()
    }
    
    func loadJson(){
        
        let path = Bundle.main.path(forResource: "example", ofType: "JSON")
        
        guard path != nil else {
            return
        }
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let response = try decoder.decode(Response.self, from: data)
            dump(response)
            
        }
        catch{
            
        }
        
    }
    
}

protocol modelDelegate {
    func passResponse(resp: Response)
}

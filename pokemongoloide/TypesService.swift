//
//  CollectionService.swift
//  NewsNow
//
//  Created by Storm on 07/11/16.
//
//

import SwiftyJSON

struct TypesService {
    
    func parseTypes(json: JSON) -> [Types] {
        
        var types = [Type]()
        
        for (_, type) in json {
            
            let type = parseType(json: type)
            
            types.append(type)
        }
        
        return types
    }
    
    func parseType(json: JSON) -> Types {
        
        let videoService = VideoService()
        let id = json["id"].intValue
        let name = json["name"].stringValue
        let format = json["format"].stringValue
        
        var collection = Collection(id: id, name: name, format: format)
        
        collection.videos = videoService.parseVideos(json: json["videos"])
        
        if let type = json["type"].string {
        
            if type == "card" { collection.type = .cardList }
            else { collection.type = .thumbList }
        }
        
        return collection
    }
}

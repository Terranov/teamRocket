//
//  PageModel.swift
//  NewsNow
//
//  Created by Storm on 07/11/16.
//
//

struct Pokemon {
    
    var id: Int
    var name = String()
    var types = [String]()
    var weakness = [String]()
    var description = String()
    var image = String()
    
    init(id: Int, name: String, types: [String], weakness: [String], description: String, image: String) {
        self.id = id
        self.name = name
        self.types = types
        self.weakness = weakness
        self.description = description
        self.image = image
    }
    
}

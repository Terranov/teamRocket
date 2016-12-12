//
//  URLS.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 12/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import Foundation

protocol URLS { }

extension URLS {
    
    func getUrl(_ type: EndPoint, filters: [(name: String, value: Any)]? = nil) -> String {
        
        return type.url
    }
}

enum EndPoint {
    
    case application
    
    var url: String {
        
        switch self {
        case .application: return "https://private-a37d8e-pokestorm.apiary-mock.com/pokemons"
        }
    }
}

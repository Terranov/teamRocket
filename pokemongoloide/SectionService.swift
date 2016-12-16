//
//  SectionService.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 12/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import SwiftyJSON


struct SectionService {
    
    func parseSections(json: JSON) -> [Section] {
        
        var sections = [Section]()
        
        for (_, section) in json {
            
            let section = parseSection(json: section)
            
            sections.append(section)
        }
        
        return sections
    }
    
    func parseSection(json: JSON) -> Section {
        
        let pokemonService = PokemonService()
        
        let id = json["id"].intValue
        let name = json["name"].stringValue
        let price = json["price"].intValue
        let pokemons = pokemonService.parsePokemons(json: json["pokemons"])
        
        return Section(id: id, name: name, price: price, pokemons: pokemons)
    }
    
}

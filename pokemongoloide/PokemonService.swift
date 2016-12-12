//
//  PokemonService.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 09/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import SwiftyJSON

struct PokemonService {
    
    func parsePokemons(json: JSON) -> [Pokemon] {
        
        var pokemons = [Pokemon]()
        
        for (_, pokemon) in json {
            
            let pokemon = parsePokemon(json: pokemon)
            
            pokemons.append(pokemon)
        }
        
        return pokemons
    }
    
    func parsePokemon(json: JSON) -> Pokemon {
        

        let id = json["id"].intValue
        let types = json["types"].stringValue
        let name = json["name"].stringValue
        let weakness = json["weakness"].stringValue
        let description = json["description"].stringValue
        let image = json["image"].stringValue

        
        var pokemon = Pokemon(id: id, name: name, types: types, weakness: weakness, description: description, image: image)
        
        return pokemon
    }
}

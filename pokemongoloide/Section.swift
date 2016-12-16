//
//  Application.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 12/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

struct Section {
    
    //MARK: Local Variable
    var id = Int()
    var name = String()
    var price = Int()
    var pokemons = [Pokemon]()
    
    init(id : Int, name : String, price : Int, pokemons : [Pokemon]) {
        self.id = id
        self.name = name
        self.price = price
        self.pokemons = pokemons
    }
}

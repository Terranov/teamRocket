//
//  Application.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 12/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

final class Application {
    
    // Can't init is singleton
    private init() { }
    
    //MARK: Shared Instance
    
    static let sharedInstance: Application = Application()
    
    //MARK: Local Variable
    var id = Int()
    var section = String()
    var price = Int()
    var pokemons = [Pokemon]()
}

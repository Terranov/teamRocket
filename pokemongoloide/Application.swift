//
//  Master.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 16/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

final class Application {
    
    // Can't init is singleton
    private init() { }
    
    //MARK: Shared Instance
    
    static let sharedInstance: Application = Application()
    
    //MARK: Local Variable
    var section = [Section]()
}

//
//  ApplicationService.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 12/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import SwiftyJSON

struct ApplicationService {
    
    func getApplication(success: @escaping (_ bool: Bool) -> Void, fail: @escaping (_ error: String) -> Void) {
        
        Request.sharedInstance.APIRequest(method: .GET, endPoint: .application,
                                          
                                          success: { result in
                                            
                                            self.parseApplication(json: JSON(result))
                                            
                                            success(true)
                                            
        }, failure: { failure in
            
            fail("Não foi possível carregar a Application.")
        }
        )
    }
    
    private func parseApplication(json: JSON) {
        
        let pokemonService = PokemonService()
        
        Application.sharedInstance.id = json["id"].intValue
        Application.sharedInstance.pokemon = pokemonService.parsePokemon(json: json["pokemon"])
    }
}

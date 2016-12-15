//
//  SectionService.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 12/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import SwiftyJSON

struct SectionService {
    
    func getSection(success: @escaping (_ bool: Bool) -> Void, fail: @escaping (_ error: String) -> Void) {
        
        Request.sharedInstance.APIRequest(method: .GET, endPoint: .Section,
                                          
                                          success: { result in
                                            
                                            self.parseSection(json: JSON(result))
                                            
                                            success(true)
                                            
        }, failure: { failure in
            
            fail("Não foi possível carregar a Section.")
        }
        )
    }
    
    private func parseSection(json: JSON) {
        
//        let featureService = FeatureService()
        let pokemonService = PokemonService()
        
//        Section.sharedInstance.id = json["id"].intValue
//        Section.sharedInstance.authClient = json["auth_client_id"].stringValue
//        Section.sharedInstance.features = featureService.parseFeatures(json: json["featured"])
        Section.sharedInstance.pokemon = pokemonService.parsePomeon(json: json["pokemon"])
    }
}

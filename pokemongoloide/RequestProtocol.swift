//
//  RequestProtocol.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 12/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import Just

protocol Requesting {
    
    func APIRequest(method: HTTPMethod, endPoint: EndPoint, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void)
}

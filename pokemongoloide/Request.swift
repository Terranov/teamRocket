//
//  Request.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 09/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import Just

enum Result<T> {
    
    case success(result: T)
    case failure(error: Int, message: String)
}

class Request: Requesting, URLS {
    
    static let sharedInstance = Request()
    
    func APIRequest(method: HTTPMethod, endPoint: EndPoint, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void) {
        
        let url = endPoint.url
        
        switch method {
        case .GET :
            
            get(to: url, success: {
                result in
                success(result)
            }, failure: {
                status in
                failure(status)
            })
            
        default: print("HTTPMethod not supported")
        }
    }
    
    func APIRequestImage(url: String, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void)  {
        
        Just.get(url) {
            r in
            
            if r.ok {
                
                guard let response = r.content else {
                    print("no content")
                    return
                }
                
                Do.now {
                    success(response)
                }
            }
            else {
                
                guard let code = r.statusCode else {
                    print("image request failure without statusCode: \(url)")
                    return
                }
                
                Do.now {
                    failure(code)
                }
            }
        }
    }
    
    private func get(to: String, success: @escaping (Any) -> Void, failure: @escaping (Int) -> Void) {
        
        Just.get(to) {
            r in
            
            if r.ok {
                
                guard let response = r.json else {
                    return print("no json")
                }
                
                Do.now { success(response) }
            }
            else {
                
                guard let code = r.statusCode else {
                    return print("get failure without statusCode")
                }
                
                Do.now { failure(code) }
            }
        }
    }
    
}

//
//  Do.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 12/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import Foundation

struct Do {
    //Método para realizar uma ação após um determinado tempo: deadline
    static func wait(seconds: Double, completion: @escaping () -> Void) {
        
        let time = DispatchTime.now() + seconds
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            
            completion()
        }
    }
    //Método para realizar a ação instantâneamente, assim que chamado.
    static func now(completion: @escaping () -> Void) {
        
        DispatchQueue.main.async {
            
            completion()
        }
    }
}

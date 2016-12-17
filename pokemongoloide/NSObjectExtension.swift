//
//  NSObjectExtension.swift
//  
//
//  Created by Vinícius Terranova on 17/12/16.
//
//

import UIKit

protocol Identifying { }

extension Identifying where Self : NSObject {
    
    static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifying { }

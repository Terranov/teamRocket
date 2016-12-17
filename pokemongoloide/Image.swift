//
//  File.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 17/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import SwiftyJSON

struct Image {
    
    static let cache = NSCache<NSString, UIImage>()
    
    static func get(url: String, success: @escaping (_ image: UIImage) -> Void) {
        
        if let cachedImage = cache.object(forKey: url as NSString) {
            return success(cachedImage)
        }
        
        Request.sharedInstance.APIRequestImage(url: url,
                                               success: { image in
                                                
                                                guard let downloadedImage = UIImage(data: (image as! Data)) else {
                                                    print("downloadedImage is not a valid image")
                                                    return
                                                }
                                                
                                                cache.setObject(downloadedImage, forKey: url as NSString)
                                                success(downloadedImage)
                                                
        }, failure: { failure in
            
            print("Não foi possível carregar imagem nesta url: \(url)")
        })
    }
}

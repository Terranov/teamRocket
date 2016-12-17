//
//  CollectionViewPokemonCell.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 17/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import UIKit

class CollectionViewPokemonCell: UICollectionViewCell {
    
    @IBOutlet fileprivate weak var pokemon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    private func setImage(_ url: String) {
        
        Image.get(url: url, success: { image in
            self.pokemon.image = image
        })
    }
}

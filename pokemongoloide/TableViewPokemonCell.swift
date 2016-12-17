//
//  TableViewPokemonCell.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 17/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import UIKit

class TableViewPokemonCell: UITableViewCell {

    @IBOutlet fileprivate weak var collection: UICollectionView!
    
    
    var delegate: TableViewLayouting?
    
    enum Direction {
        
        case horizontal
        case vertical
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /*func setStyle(type: CollectionType, direction: Direction) {
        
        let layout = collection.collectionViewLayout as? UICollectionViewFlowLayout
        
        let screenSize: CGRect = UIScreen.main.bounds
        var cellWidth = type.width
        
        if direction == .vertical {
            layout?.scrollDirection = .vertical
            cellWidth = screenSize.width / 2 - 5
        }
        
        layout?.itemSize = CGSize(width: cellWidth, height: type.height)
    }*/

    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collection.delegate = dataSourceDelegate
        collection.dataSource = dataSourceDelegate
        collection.tag = row
        collection.setContentOffset(collection.contentOffset, animated:false)
        collection.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set { collection.contentOffset.x = newValue }
        get { return collection.contentOffset.x }
    }
}

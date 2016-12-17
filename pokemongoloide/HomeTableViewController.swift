//
//  HomeTableViewController.swift
//  pokemongoloide
//
//  Created by Vinícius Terranova on 08/12/16.
//  Copyright © 2016 Vinícius Terranova. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var home: Application?
    

    //fileprivate var pokemonSelected = Pokemon()
    fileprivate var storedOffsets = [Int: CGFloat]()
    fileprivate var sectionHeight = CGFloat(40)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let home = self.home else { return 0 }
        
        return home.section.count

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let home = self.home, let section = home.section.first else { return 0 }
        
        if home.section.count > 1 { return 1 }
        else {
            return section.pokemons.count
        }

        
    }

    override internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return sectionHeight
    }
    
    override internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let home = self.home else { return UIView() }
        
        let section_ = section
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: sectionHeight))
        header.backgroundColor = .white
        
        let title = UILabel(frame: CGRect(x: 10, y: 7, width: view.frame.width, height: header.bounds.height))
        title.text = home.section[section_].name
        title.font = UIFont.boldSystemFont(ofSize: 16)
        title.textColor = .darkGray
        header.addSubview(title)
        
        return header
    }
    
    override internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 250
    }
    
    override internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell = tableView.dequeueReusableCell(withIdentifier: TableViewPokemonCell.identifier, for: indexPath) as! TableViewPokemonCell
                
         return cell

    }
    
    override internal func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let home = self.home, let section = home.section.first else { return }
        
        var section_ = indexPath.section

        guard let tableViewCell = cell as? TableViewPokemonCell else { return }
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: section_)
        tableViewCell.collectionViewOffset = storedOffsets[section_] ?? 0

        
}



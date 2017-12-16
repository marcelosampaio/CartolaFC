//
//  TopController.swift
//  CartolaFC
//
//  Created by Marcelo on 12/14/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit
import Kingfisher

class TopController: UITableViewController {
    
    // MARK: - Properties
    var clubes = [Clube]()
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
         appearance()
        
    }

    // MARK: - Appearance
    private func appearance() {
        navigationItem.title = "Top 10"
        tableView.backgroundColor = UIColor.backgroundColor
        
    }

    // MARK: - Table View DataSource and Delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clubes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TopTeamsCell
        let clube = clubes[indexPath.row]
        cell.name.text = clube.nome
        cell.position.text = clube.posicao! + "º"
        
        if clube.escudos[0].url == nil {
            cell.badge.image = UIImage(named: "ball")
        }else{
            let url = URL(string: clube.escudos[0].url!)
            // image
            cell.badge?.kf.setImage(with: url)
            
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }


}

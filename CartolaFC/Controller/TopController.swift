//
//  TopController.swift
//  CartolaFC
//
//  Created by Marcelo on 12/14/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class TopController: UITableViewController {
    
    // MARK: - Properties
    var clubes = [Clube]()
    

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
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

        return cell
    }
    


}

//
//  MenuController.swift
//  CartolaFC
//
//  Created by Marcelo on 12/14/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("☘️ selected row \(indexPath.section)")
    }

}

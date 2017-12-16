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
    var sortedClubes = [Clube]()
    var organizedResult = [Clube]()
    var sortControl = true
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        appearance()
        organizer(asc: sortControl)
        
        
    }

    // MARK: - Appearance
    private func appearance() {
        navigationItem.title = "Top 10"
        tableView.backgroundColor = UIColor.backgroundColor
        
        //////
        let rightBarButton = UIBarButtonItem(title: "▲▼", style: UIBarButtonItemStyle.plain, target: self, action: #selector(sortResult(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButton
        //////
    }

    // MARK: - Helper
    private func organizer(asc: Bool) {
        sortedClubes = clubes.sorted(by: { $0.posicao! < $1.posicao! })
        
        
        // just 10 occurrences
        organizedResult.removeAll()
        let listCount = 10
        if asc {
            for i in 0..<sortedClubes.count - 1 {
                if i < listCount {
                    organizedResult.append(sortedClubes[i])
                }
            }
        } else {
            for i in (0..<sortedClubes.count).reversed() {
                if i < listCount {
                    organizedResult.append(sortedClubes[i])
                }
            }
        }
        tableView.reloadData()
    }
    
    // MARK: - Table View DataSource and Delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizedResult.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TopTeamsCell
        let clube = organizedResult[indexPath.row]
        cell.name.text = clube.nome
        cell.position.text = String(clube.posicao!) + "º"
        
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

    // MARK: - UI Actions
    @objc func sortResult(_ sender:UIBarButtonItem!)
    {
        print("👍 sortResult")
        if sortControl {
            sortControl = false
        }else{
            sortControl = true
        }

        organizer(asc: sortControl)
    }
    

}

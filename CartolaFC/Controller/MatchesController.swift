//
//  MatchesController.swift
//  CartolaFC
//
//  Created by Marcelo on 12/14/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class MatchesController: UITableViewController {

    // MARK: - Properties
    var partidaResponse = PartidaResponse()
    var sortedPartidas = [Partida]()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sort by date and time
        sortedPartidas = partidaResponse.partidas.sorted(by: { $0.partida_data! < $1.partida_data! })
        
        appearance()
    }

    // MARK: - Appearance
    private func appearance() {
        navigationItem.title = "Partidas"
        self.view.backgroundColor = UIColor.backgroundColor
    }
    
    

    // MARK: - Table View Data Source and Delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedPartidas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let partida = sortedPartidas[indexPath.row]
        let cell = getCell(cell: tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MatchesCell, partida: partida)
        return cell
    }
    
    // MARK: - Table View Helper
    private func getCell(cell: MatchesCell, partida: Partida) -> MatchesCell {
        // name
        cell.name1.text = getTeamName(partida.clube_casa_id!)
        cell.name2.text = getTeamName(partida.clube_visitante_id!)
        // score
        cell.score1.text = partida.placar_oficial_mandante
        cell.score2.text = partida.placar_oficial_visitante
        // other info
        cell.dateTime.text = getFormattedDate(partida.partida_data!)
        cell.stadium.text = partida.local!
        
        // bagdes
        var url = getTeamBadge(partida.clube_casa_id!)
        if url == "" {
            cell.badge1.image = UIImage(named: "ball")
        }else{
            let url = URL(string: url)
            // image
            cell.badge1?.kf.setImage(with: url)
        }
        url = getTeamBadge(partida.clube_visitante_id!)
        if url == "" {
            cell.badge2.image = UIImage(named: "ball")
        }else{
            let url = URL(string: url)
            // image
            cell.badge2.kf.setImage(with: url)
        }
        return cell
    }
 
    // MARK: - Application Helper
    private func getTeamName(_ id: String) -> String {
        for clube in partidaResponse.clubes {
            if clube.clube_id == id {
                return clube.abreviacao!
            }
        }
        return ""
    }
    
    private func getTeamBadge(_ id: String) -> String {
        for clube in partidaResponse.clubes {
            if clube.clube_id == id {
                return clube.escudos[0].url!
            }
        }
        return ""
    }
    
    
    private func getFormattedDate(_ dateString: String) -> String {
        let dateTimeArray = dateString.components(separatedBy: " ")
        let dateString = dateTimeArray[0]
        let dateArray = dateString.components(separatedBy: "-")
        let timeString = dateTimeArray[1]
        let timeArray = timeString.components(separatedBy: ":")
        return dateArray[2] + "/" + dateArray[1] + "/" + dateArray[0] + " " + timeArray[0] + ":" + timeArray[1] + "h"
    }
    
    
}

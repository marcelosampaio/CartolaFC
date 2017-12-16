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
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        appearance()
    }

    // MARK: - Appearance
    private func appearance() {
        navigationItem.title = "Rodada"
    }
    
    

    // MARK: - Table View Data Source and Delegate

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partidaResponse.partidas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MatchesCell
        let partida = partidaResponse.partidas[indexPath.row]

        
        cell.name1.text = getTeamName(partida.clube_casa_id!)
        cell.name2.text = getTeamName(partida.clube_visitante_id!)
        cell.dateTime.text = getFormattedDate(partida.partida_data!)
        cell.stadium.text = partida.local!

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
    
    private func getFormattedDate(_ dateString: String) -> String {
        let dateTimeArray = dateString.components(separatedBy: " ")
        let dateString = dateTimeArray[0]
        let dateArray = dateString.components(separatedBy: "-")
        let timeString = dateTimeArray[1]
        let timeArray = timeString.components(separatedBy: ":")
        return dateArray[2] + "/" + dateArray[1] + "/" + dateArray[0] + " " + timeArray[0] + ":" + timeArray[1] + "h"
    }
    
    
}

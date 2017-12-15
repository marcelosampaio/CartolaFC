//
//  MenuController.swift
//  CartolaFC
//
//  Created by Marcelo on 12/14/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit

class MenuController: UITableViewController {

    // MARK: - Properties
    var partidaResponse = PartidaResponse()
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get cartola data
        getCartolaData()
        
        
    }

    // MARK: - Application Data Source
    private func getCartolaData() {
        ServiceAPI.getCartolaData(success: { (response) in
            // completion success
            self.partidaResponse = response
            
        }) { (error) in
            // error
            self.alert(message: "Problemas ao recuperar os dados do Cartola FC.")
        }
    }
    
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            // Top
            performSegue(withIdentifier: "showTopTeams", sender: nil)
        } else if indexPath.section == 1 {
            performSegue(withIdentifier: "showMatches", sender: nil)
        }
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("🚩 prepare for segue  🚩")
        if segue.identifier == "showTopTeams" {
            let controller = segue.destination as! TopController
            controller.clubes = partidaResponse.clubes
            
        }else if segue.identifier == "showMatches"{
            let controller = segue.destination as! MatchesController
            controller.partidaResponse = partidaResponse
        }
    }
    
    
    // MARK: - Alert Helper
    private func alert(message: String){
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            // OK
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true) {
            // completion
        }
        
        
    }
    
    
}

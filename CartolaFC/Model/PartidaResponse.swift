//
//  PartidaResponse.swift
//  CartolaFC
//
//  Created by Marcelo on 12/15/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import Foundation

struct PartidaResponse {
    var partidas = [Partida]()
    var clubes = [Clube]()
    var rodada: String?
    
    init(){
        self.partidas = [Partida]()
        self.clubes = [Clube]()
        self.rodada = String()
    }
    
    init(dictionary: NSDictionary) {
        let partidasArray = dictionary["partidas"] as! NSArray
        let clubesDic = dictionary["clubes"] as! NSDictionary
        
        // populate "partidas"
        for item in partidasArray {
            let partidaDic = item as! NSDictionary
            let partidaObject = Partida.init(dictionary: partidaDic)
            self.partidas.append(partidaObject)
        }
        
        // populate "clubes"
        for (_, value) in clubesDic {
            let clubeDic = value as! NSDictionary
            let clubeObject = Clube.init(dictionary: clubeDic)
            self.clubes.append(clubeObject)
        }
        
        // populate "rodada"
        self.rodada = String(describing: dictionary["rodada"]!)
    }
    
}

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
    
    
}

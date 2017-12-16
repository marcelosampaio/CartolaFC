//
//  Clube.swift
//  CartolaFC
//
//  Created by Marcelo on 12/15/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import Foundation

struct Clube {
    var clube_id: String?
    var nome: String?
    var abreviacao: String?
    var posicao: Int?
    var escudos = [Escudo]()
    
    init(){
        self.clube_id = String()
        self.nome = String()
        self.abreviacao = String()
        self.posicao = 0
        self.escudos = [Escudo]()
    }
    
    
}

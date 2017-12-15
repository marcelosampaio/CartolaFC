//
//  Partida.swift
//  CartolaFC
//
//  Created by Marcelo on 12/15/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import Foundation

struct Partida {
    var partida_id: String?
    var clube_casa_id: String?
    var clube_casa_posicao: String?
    var clube_visitante_id: String?
    var aproveitamento_mandante = [String]()
    var aproveitamento_visitante = [String]()
    var clube_visitante_posicao: String?
    var partida_data: String?
    var local: String?
    var valida: Bool = false
    var placar_oficial_mandante: String?
    var placar_oficial_visitante: String?
    var url_confronto: String?
    var url_transmissao: String?
    
    init(){
        self.partida_id = String()
        self.clube_casa_id = String()
        self.clube_casa_posicao = String()
        self.clube_visitante_id = String()
        self.aproveitamento_mandante = [String]()
        self.aproveitamento_visitante = [String]()
        self.clube_visitante_posicao = String()
        self.partida_data = String()
        self.local = String()
        self.valida = false
        self.placar_oficial_mandante = String()
        self.placar_oficial_visitante = String()
        self.url_confronto = String()
        self.url_transmissao = String()
        
    }
    
    
}

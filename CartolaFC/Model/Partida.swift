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
    
    init(dictionary: NSDictionary) {
        self.partida_id = String(describing: dictionary["partida_id"]!)
        self.clube_casa_id = String(describing: dictionary["clube_casa_id"]!)
        self.clube_casa_posicao = String(describing: dictionary["clube_casa_posicao"]!)
        self.clube_visitante_id = String(describing: dictionary["clube_visitante_id"]!)
        self.aproveitamento_mandante = (dictionary["aproveitamento_mandante"] as? [String])!
        self.aproveitamento_visitante = (dictionary["aproveitamento_visitante"] as? [String])!
        self.clube_visitante_posicao = String(describing: dictionary["clube_visitante_posicao"]!)
        self.partida_data = dictionary["partida_data"] as? String
        self.local = dictionary["local"] as? String
        self.valida = (dictionary["valida"] as? Bool)!
        self.placar_oficial_mandante = String(describing: dictionary["placar_oficial_mandante"]!)
        self.placar_oficial_visitante = String(describing: dictionary["placar_oficial_visitante"]!)
        self.url_confronto = dictionary["url_confronto"] as? String
        self.url_transmissao = dictionary["url_transmissao"] as? String
    }
    
}

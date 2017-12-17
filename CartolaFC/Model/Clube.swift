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
    
    init(dictionary: NSDictionary) {
        
        self.clube_id = String(describing: dictionary["id"]!)
        self.nome = dictionary["nome"] as? String
        self.abreviacao = dictionary["abreviacao"] as? String
        self.posicao = dictionary["posicao"]! as? Int
        let escudosDic = dictionary["escudos"] as! NSDictionary
        
        // populate "escudos"
        for (key, value) in escudosDic {
            let escudoStr = value as! String
            let escudoTamanho = key as! String
            let escudoObject = Escudo.init(escudoStr: escudoStr, escudoTamanho: escudoTamanho)
            self.escudos.append(escudoObject)
        }
        
    }
    
    
}

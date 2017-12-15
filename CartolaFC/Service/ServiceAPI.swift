//
//  ServiceAPI.swift
//  CartolaFC
//
//  Created by Marcelo on 12/15/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

import UIKit
import Alamofire

class ServiceAPI: NSObject {

    // MARK: - Search Movies
    class func getCartolaData(success:@escaping (PartidaResponse) -> Void, failure:@escaping (Error) -> Void) {

        // get url
        let url = getPlist(key: "getCartolaData")
        
        print("🍟 -> getCartolaData url: \(url)")
        
        
        Alamofire.request(url).responseJSON { (response) -> Void in
            if response.result.isSuccess {
                
                var partidaResponse = PartidaResponse()
                
                print("🍟  RESPONSE OK")

                if let result = response.result.value {
                    let resultDic = result as! NSDictionary
                    partidaResponse = populateModel(dic: resultDic)
                }

                success(partidaResponse)
            }
            
            if response.result.isFailure {
                print("*** Failure API call <getMoviesBySearch>")
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }
    
    
    // MARK: - Class Helper
    class func getPlist(key: String) -> String {
        var result = String()
        if let path = Bundle.main.path(forResource: "Config", ofType: "plist") {
            
            // file root is a dictionary
            if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
                result = dic[key] as! String
            }
        }
        return result
    }

    private class func populateModel(dic: NSDictionary) -> PartidaResponse {

        let partidasArray = dic["partidas"] as! NSArray
        let clubesDic = dic["clubes"] as! NSDictionary
        
        
        var partidaResponse = PartidaResponse()
        
        // populate "partidas"
        for item in partidasArray {
            let partidaDic = item as! NSDictionary
            let partidaObject = populatePartidaObject(partidaDic)
            partidaResponse.partidas.append(partidaObject)
        }
        
        // populate "clubes"
        for (key, value) in clubesDic {
            print("👉 key: \(key)  👉 value: \(value)")
        }
        
        
        return PartidaResponse()
    }
    
    private class func populatePartidaObject(_ partidaDic: NSDictionary) -> Partida {
        var partida = Partida()
        partida.partida_id = String(describing: partidaDic["partida_id"]!)
        partida.clube_casa_id = String(describing: partidaDic["clube_casa_id"]!)
        partida.clube_casa_posicao = String(describing: partidaDic["clube_casa_posicao"]!)
        partida.clube_visitante_id = String(describing: partidaDic["clube_visitante_id"]!)
        partida.aproveitamento_mandante = (partidaDic["aproveitamento_mandante"] as? [String])!
        partida.aproveitamento_visitante = (partidaDic["aproveitamento_visitante"] as? [String])!
        partida.clube_visitante_posicao = String(describing: partidaDic["clube_visitante_posicao"]!)
        partida.partida_data = partidaDic["partida_data"] as? String
        partida.local = partidaDic["local"] as? String
        partida.valida = (partidaDic["valida"] as? Bool)!
        partida.placar_oficial_mandante = String(describing: partidaDic["placar_oficial_mandante"]!)
        partida.placar_oficial_visitante = String(describing: partidaDic["placar_oficial_visitante"]!)
        partida.url_confronto = partidaDic["url_confronto"] as? String
        partida.url_transmissao = partidaDic["url_transmissao"] as? String
        return partida
    }
}

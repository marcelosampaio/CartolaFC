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
        
        for item in partidasArray {
            let partidaDic = item as! NSDictionary
            let partidaObject = populatePartidaObject(partidaDic)
            
            
        }
        
        
        return PartidaResponse()
    }
    
    private class func populatePartidaObject(_ partidaDic: NSDictionary) -> Partida {
        
        print("👉... partidaDic: \(String(describing: partidaDic["clube_casa_id"]))")
        
        return Partida()
        
    }
}

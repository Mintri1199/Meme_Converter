//
//  CurrencyCodes.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/12/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import Foundation

struct CurrencyCodes{
    var codes : [String]
    
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    init(json: [String: [String: Any]]) throws {
        guard let test = Array((json["results"]?.keys)!) as? [String] else {throw SerializationError.missing("codes doesn't exist")}
        self.codes = test
    }
    
    // Returning a list of currency codes instead of hardcoding it in
    static func gettingCodes(completion: @escaping ([String]) -> ()) {
        
        var currencyCodes: [String] = []
        
        let urlString = "https://free.currencyconverterapi.com/api/v6/currencies"
        
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let dataResponse = data, error == nil else{print(error?.localizedDescription ?? "Response Error")
                return}
            
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: []) as! NSDictionary
                guard let jsonContent = jsonResponse as? [String: [String: Any]] else {return}
                for key in (jsonContent["results"]?.keys)!{
                    currencyCodes.append(key)                }
                
            }catch{
                print("error")
            }
            
            completion(currencyCodes)
        }
        task.resume()
    }
}


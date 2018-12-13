//
//  CurrencyCodes.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/12/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import Foundation



func gettingCodes(){
    var currencyCodes = [String]()
    
    guard let url = URL(string: "https://free.currencyconverterapi.com/api/v6/currencies") else {return}
    
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let dataResponse = data, error == nil else{print(error?.localizedDescription ?? "Response Error")
            return}
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: []) as! NSDictionary
            //print(jsonResponse["results"])
            if let jsonContent = jsonResponse["results"] {
                print(jsonContent)
            }
            
        }catch{
            print("error")
        }
    }
    task.resume()
    
}

//
//  network.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/6/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import Foundation

struct CurrencyConversion {
    var baseCurrency: String
    var convertingCurrency: String
    var convertingAmount: Double
}


func network() {
    
    guard let url = URL(string: "https://free.currencyconverterapi.com/api/v6/convert?q=USD_PHP,PHP_USD") else {return}
    //data: content, response: HTTP status code, Error: error
    let task = URLSession.shared.dataTask(with: url) {(data, reponse, error) in
        guard let dataResponse = data , error == nil else {print(error?.localizedDescription ?? "Response Error")
            return}
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
            guard let jsonContent = jsonResponse as? [String: Any] else {
                return
            }
           // guard let rates = jsonResponse["rates"] as? Array else {return}
            print(jsonContent)
            
            
        }catch{
            print("error")
        }
    }
    task.resume()
}

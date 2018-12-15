//
//  network.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/6/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import Foundation

func getRates(firstCurrency: String, secondCurrency: String /*completion: @escaping(Double) -> ()*/) {
    //var rates : Double = 0
    let firstPair: String = "\(firstCurrency)_\(secondCurrency)"
    let secondPair: String = "\(secondCurrency)_\(firstCurrency)"
    
    guard let url = URL(string: "https://free.currencyconverterapi.com/api/v6/convert?q=\(firstPair),\(secondPair)") else {return}
    //data: content, response: HTTP status code, Error: error
    let task = URLSession.shared.dataTask(with: url) {(data, reponse, error) in
        guard let dataResponse = data , error == nil else {print(error?.localizedDescription ?? "Response Error")
            return}
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
            guard let jsonContent = jsonResponse as? [String: [String: Any]] else {
                return
            }
            // guard let rates = jsonResponse["rates"] as? Array else {return}
            let initial = jsonContent["results"]
            let conversion = initial?["\(firstPair)"]
            

            
        }catch{
            print("error")
        }
    }
    task.resume()
}

// TODO: Fix JSON Error and return a DOUBLE
func mockRates() {

    let firstPair: String = "USD_EUR"
    let secondPair: String = "EUR_USD"
    
    guard let url = URL(string: "https://free.currencyconverterapi.com/api/v6/convert?q=\(firstPair),\(secondPair)") else {return}
    let task = URLSession.shared.dataTask(with: url) {(data, reponse, error) in
        guard let dataResponse = data , error == nil else {print(error?.localizedDescription ?? "Response Error")
            return}
        do {
            let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: [])
            guard let jsonContent = jsonResponse as? [String: [String: Any]] else {
                return
            }
            // guard let rates = jsonResponse["rates"] as? Array else {return}
            let initial = jsonContent["results"]
            let conversion = initial?["\(firstPair)"]
            print(conversion)
            
        }catch{
            print("error")
        }
    }
    task.resume()
}


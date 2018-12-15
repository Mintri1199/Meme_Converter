//
//  SecondCurrencyPickerViewController.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/14/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

protocol ChangingSecondCurrency {
    func changeCurrencyLabel(newCode: String)
}

class SecondCurrencyPickerViewController: UITableViewController {
    // Initialize empty array for currency codes
    var currencyCodes = [String]()
    var delegate: ChangingSecondCurrency?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("In second picker")
        navigationController?.isNavigationBarHidden = false
        tableView.delegate = self
        tableView.register( UITableViewCell.self, forCellReuseIdentifier: "cell")
        CurrencyCodes.gettingCodes { (results:[String]) in
            self.currencyCodes = results.sorted()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyCodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currencyCodes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell =  tableView.cellForRow(at: indexPath)
        guard let code = cell?.textLabel?.text else {return}
        delegate?.changeCurrencyLabel(newCode: code)
        
        navigationController?.popViewController(animated: true)
        
    }

}

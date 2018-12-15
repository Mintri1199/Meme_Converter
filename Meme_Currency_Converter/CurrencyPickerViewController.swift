//
//  CurrencyPickerViewController.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/12/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

protocol MoveData {
    func changeCurrencyCode(newCode: String)
}

class CurrencyPickerViewController: UITableViewController {
    var currencyCodes = [String]()
    var delegate: MoveData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        delegate?.changeCurrencyCode(newCode: code)

        navigationController?.popViewController(animated: true)
        
    }


}


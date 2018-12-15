//
//  ViewController.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/3/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MoveData, ChangingSecondCurrency{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNumpad()
        setupCurrenciesView()
        //network()
        let gesture  = UITapGestureRecognizer(target: self, action: #selector(changeCurrency))
        let gesture2  = UITapGestureRecognizer(target: self, action: #selector(changeCurrency))
        
        firstCurrencyView.currencyCodeLabel.isUserInteractionEnabled = true
        firstCurrencyView.currencyCodeLabel.addGestureRecognizer(gesture)
        secondCurrencyView.currencyCodeLabel.isUserInteractionEnabled = true
        secondCurrencyView.currencyCodeLabel.addGestureRecognizer(gesture2)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateLabel(_:)), name: NSNotification.Name(rawValue: "updateLabel"), object: nil)
    }
    let numpad = NumpadView(frame: .zero)
    
    func setupNumpad(){
        view.addSubview(numpad)
        NSLayoutConstraint.activate([
            numpad.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.bounds.height/3),
            numpad.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            numpad.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            numpad.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ])
    }
    // Instantiate the two currency views
    let firstCurrencyView: CurrencyView = {
        var view = CurrencyView(frame: .zero)
        view.currencyCodeLabel.text = "USD"
        return view
    }()
    
    let secondCurrencyView: CurrencyView = {
        var view = CurrencyView(frame: .zero)
        view.currencyCodeLabel.text = "EUR"
        view.currencyCodeLabel.backgroundColor = .cyan
        return view
    }()
    
    var currenciesStackView = UIStackView()
    
    func setupCurrenciesView(){
        view.addSubview(currenciesStackView)
        currenciesStackView.addArrangedSubview(firstCurrencyView)
        currenciesStackView.addArrangedSubview(secondCurrencyView)
        currenciesStackView.axis = .vertical
        currenciesStackView.distribution = .fillEqually
        currenciesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            currenciesStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            currenciesStackView.bottomAnchor.constraint(equalTo: numpad.topAnchor),
            currenciesStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            currenciesStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
    }
    
    @objc func changeCurrency (){
        let nextVC = CurrencyPickerViewController()
        nextVC.delegate = self
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func changeSecondCurrency() {
        let nextVC = SecondCurrencyPickerViewController()
        nextVC.delegate = self
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func changeCurrencyCode(newCode: String) {
        firstCurrencyView.currencyCodeLabel.text = newCode
    }

    func changeCurrencyLabel(newCode: String) {
        secondCurrencyView.currencyCodeLabel.text = newCode
    }
    
    @objc func updateLabel(_ notification: NSNotification) {
        guard let mainLabel = firstCurrencyView.amountLabel.text else {return}
        
        
        if let passedNumber = notification.userInfo?["number"] as? Int{
            if mainLabel == "0"{
                firstCurrencyView.amountLabel.text = "\(passedNumber)"
            }else{
                firstCurrencyView.amountLabel.text = mainLabel + "\(passedNumber)"
            }
        }
        
        if let _ = notification.userInfo?["decimal"] as? Bool {
            if mainLabel.contains("."){
                return
            }else{
                firstCurrencyView.amountLabel.text = mainLabel + "."
            }
        }
        
        if let _ = notification.userInfo?["clear"] as? Bool {
            firstCurrencyView.amountLabel.text = "0"
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "updateLabel"), object: nil)
    }
}


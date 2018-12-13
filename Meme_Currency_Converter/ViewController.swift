//
//  ViewController.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/3/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNumpad()
        setupLabel()
        //network()
        gettingCodes()
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
    
    let mainCurrencyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "0"
        label.font = UIFont(name: "Helvetica", size: 25)
        label.backgroundColor = .white
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    let secondaryCurrencyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "0"
        label.font = UIFont(name: "Helvetica", size: 25)
        label.backgroundColor = .white
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    
    func setupLabel() {
        let labelStackView = UIStackView(frame: .zero)
        labelStackView.addArrangedSubview(mainCurrencyLabel)
        labelStackView.addArrangedSubview(secondaryCurrencyLabel)
        labelStackView.distribution = .fillEqually
        labelStackView.spacing = 0
        labelStackView.axis = .vertical
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(labelStackView)
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: numpad.topAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
    }
    
    @objc func updateLabel(_ notification: NSNotification) {
        // TODO: Make sure Unwrap this is
        guard let mainLabel = mainCurrencyLabel.text else {return}
        
        
        if let passedNumber = notification.userInfo?["number"] as? Int{
            if mainLabel == "0"{
                mainCurrencyLabel.text = "\(passedNumber)"
            }else{
                mainCurrencyLabel.text = mainLabel + "\(passedNumber)"
            }
        }
        
        if let _ = notification.userInfo?["decimal"] as? Bool {
            if mainLabel.contains("."){
                return
            }else{
                mainCurrencyLabel.text = mainLabel + "."
            }
        }
        
        if let _ = notification.userInfo?["clear"] as? Bool {
            mainCurrencyLabel.text = "0"
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "updateLabel"), object: nil)
    }
}


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
        network()
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
        label.text = "This is the first currency"
        label.font = UIFont(name: "Helvetica", size: 25)
        label.backgroundColor = .blue
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    let secondaryCurrencyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "This is the second currency"
        label.font = UIFont(name: "Helvetica", size: 25)
        label.backgroundColor = .blue
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

}


//
//  CurrencyView.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/14/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

// This view contains the currency code and amount
class CurrencyView: UIView {

    var currencyCodeLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.backgroundColor = .yellow
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 20)
        return label
        }()
    
    var amountLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textAlignment = .right
        label.font = UIFont(name: "Helvetica", size: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupCodeLabel()
        setupAmmountLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCodeLabel() {
        addSubview(currencyCodeLabel)
        NSLayoutConstraint.activate([
            currencyCodeLabel.topAnchor.constraint(equalTo: topAnchor),
            currencyCodeLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            currencyCodeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            currencyCodeLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            ])
    }
    
    func setupAmmountLabel() {
        addSubview(amountLabel)
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: topAnchor),
            amountLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: currencyCodeLabel.trailingAnchor),
            amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
    
    
}

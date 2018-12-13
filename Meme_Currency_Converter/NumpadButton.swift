//
//  NumpadButton.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/6/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class NumpadButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        titleLabel?.textColor = .white
        titleLabel?.textAlignment = .center
        addTarget(self, action: #selector(NumberButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func NumberButtonTapped(){
        let appView = ViewController()
        appView.mainCurrencyLabel.text = "\(tag)"
        print(tag)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateLabel"), object: nil, userInfo: ["number" : tag])
    }
    
    
}

//
//  NumpadStackView.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/6/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class NumpadStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        spacing = 0
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false 
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//
//  NumRowStackView.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/6/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class NumRowStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        spacing = 0
        distribution = .fillEqually
        axis = .horizontal
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

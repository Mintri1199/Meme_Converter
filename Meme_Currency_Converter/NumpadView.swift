//
//  MainView.swift
//  Meme_Currency_Converter
//
//  Created by Jackson Ho on 12/6/18.
//  Copyright © 2018 Jackson Ho. All rights reserved.
//

import UIKit

class NumpadView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false 
        setupAllRows()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let button0: NumpadButton = {
        let button = NumpadButton(frame: .zero)
        button.setTitle("0", for: .normal)
        button.tag = 0
        return button
    }()
    let button1: NumpadButton = {
        let button = NumpadButton(frame: .zero)
        button.setTitle("1", for: .normal)
        button.tag = 1
        return button
    }()
    
    let button2: NumpadButton = {
        let button = NumpadButton(frame: .zero)
        button.setTitle("2", for: .normal)
        button.tag = 2
        return button
    }()
    let button3: NumpadButton = {
        let button = NumpadButton(frame: .zero)
        button.setTitle("3", for: .normal)
        button.tag = 3
        return button
    }()
    
    let button4: NumpadButton = {
        let button = NumpadButton(frame: .zero)
        button.setTitle("4", for: .normal)
        button.tag = 4
        return button
    }()
    
    let button5: NumpadButton = {
        let button = NumpadButton(frame: .zero)
        button.setTitle("5", for: .normal)
        button.tag = 5
        return button
    }()
    let button6: NumpadButton = {
        let button = NumpadButton(frame: .zero)
        button.setTitle("6", for: .normal)
        button.tag = 6
        return button
    }()
    let button7: NumpadButton = {
        let button = NumpadButton(frame: .zero)
        button.setTitle("7", for: .normal)
        button.tag = 7
        return button
    }()
    let button8: NumpadButton = {
        let button = NumpadButton(frame: .zero)
        button.setTitle("8", for: .normal)
        button.tag = 8
        return button
    }()
    let button9: NumpadButton = {
        let button = NumpadButton(frame: .zero)
        button.setTitle("9", for: .normal)
        button.tag = 9
        return button
    }()
    
    let decimalButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle(".", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(addDecimal), for: .touchUpInside)
        return button
    }()
    
    let clearButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("C", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(clearTapped), for: .touchUpInside)
        return button
    }()
    
    var firstRow = NumRowStackView(frame: .zero)
    var secondRow = NumRowStackView(frame:.zero)
    var thirdRow = NumRowStackView(frame:.zero)
    var fourthRow = NumRowStackView(frame: .zero)
    
    func setupFirstRow() -> UIStackView{
        firstRow.addArrangedSubview(button1)
        firstRow.addArrangedSubview(button2)
        firstRow.addArrangedSubview(button3)
        return firstRow
    }
    func setupSecondRow() -> UIStackView{
        secondRow.addArrangedSubview(button4)
        secondRow.addArrangedSubview(button5)
        secondRow.addArrangedSubview(button6)
        return secondRow
    }
    func setupThirdRow() -> UIStackView{
        thirdRow.addArrangedSubview(button7)
        thirdRow.addArrangedSubview(button8)
        thirdRow.addArrangedSubview(button9)
        return thirdRow
    }
    
    func setupFourthRow() -> UIStackView{
        fourthRow.addArrangedSubview(decimalButton)
        fourthRow.addArrangedSubview(button0)
        fourthRow.addArrangedSubview(clearButton)
        return fourthRow
    }
    
    func setupAllRows(){
        let outerStackView = NumpadStackView(frame: .zero)
        outerStackView.addArrangedSubview(setupFirstRow())
        outerStackView.addArrangedSubview(setupSecondRow())
        outerStackView.addArrangedSubview(setupThirdRow())
        outerStackView.addArrangedSubview(setupFourthRow())
        addSubview(outerStackView)
        
        NSLayoutConstraint.activate([
            outerStackView.topAnchor.constraint(equalTo: self.topAnchor),
            outerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ])
    }
    
    @objc func addDecimal() {
        NotificationCenter.default.post(name: NSNotification.Name("updateLabel"), object: nil, userInfo: ["decimal" : true])
    }

    @objc func clearTapped() {
        NotificationCenter.default.post(name: NSNotification.Name("updateLabel"), object: nil, userInfo: ["clear": true])
    }
}

//
//  NumberButton.swift
//  Calculator
//
//  Created by 박태임 on 2020/06/08.
//  Copyright © 2020 taeiim. All rights reserved.
//

import UIKit

class NumberButton: UIButton {

    override func awakeFromNib() {
        backgroundColor = UIColor(named: "NumberGray")
        setTitleColor(.white, for: .normal)
        
        layer.cornerRadius = 25
    }

}

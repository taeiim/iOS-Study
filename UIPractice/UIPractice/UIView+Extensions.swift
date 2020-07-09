//
//  UIView+Extensions.swift
//  UIPractice
//
//  Created by 박태임 on 2020/07/06.
//  Copyright © 2020 taeiim. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
}

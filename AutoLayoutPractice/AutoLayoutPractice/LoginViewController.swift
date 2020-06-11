//
//  LoginViewController.swift
//  AutoLayoutPractice
//
//  Created by 박태임 on 2020/06/11.
//  Copyright © 2020 taeiim. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBgViewBorder()
    }

    func setBgViewBorder() {
        bgView.layer.cornerRadius = 4
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.darkGray.cgColor
      
    }
}

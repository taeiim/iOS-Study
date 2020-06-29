//
//  ViewController.swift
//  TableViewPracticeAlone
//
//  Created by 박태임 on 2020/06/26.
//  Copyright © 2020 taeiim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAction(_ sender: Any) {
        let viewControlelr = storyboard?.instantiateViewController(withIdentifier: "CitizenViewController") as? CitizenViewController
        viewControlelr!.delegate = self
        
        present(viewControlelr!, animated: true, completion: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let viewController = segue.destination as? CitizenViewController
//        viewController?.delegate = self
//    }
}

extension ViewController: CitizenDelegate {
    func buttonClicked(name: String) {
        nameLabel.text = name
    }
}

//
//  CitizenTableViewCell.swift
//  TableViewPracticeAlone
//
//  Created by 박태임 on 2020/06/26.
//  Copyright © 2020 taeiim. All rights reserved.
//

import UIKit

protocol CitizenTableViewDelegate {
    func buttonClicked(cell: CitizenTableViewCell)
}

class CitizenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var citizenImageView: UIImageView!
    @IBOutlet weak var citizenNameLabel: UILabel!
    @IBOutlet weak var citizenDescLabel: UILabel!
    @IBOutlet weak var likeBtn: UIButton!
    var delegate : CitizenTableViewDelegate?
    
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        delegate?.buttonClicked(cell: self)
        likeBtn.isSelected.toggle()
    }
    
    func setData(data:Citizen) {
        citizenNameLabel.text = data.name
        citizenDescLabel.text = data.catchphrase
        
        let url = URL(string: data.imageUrl)
        citizenImageView.kf.setImage(with: url)
    }
}

//
//  CitizenViewController.swift
//  TableViewPracticeAlone
//
//  Created by 박태임 on 2020/06/26.
//  Copyright © 2020 taeiim. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class CitizenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var citizens : [Citizen] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        citizens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CitizenTableViewCell", for: indexPath) as? CitizenTableViewCell else {return.init()}
        let citizen = citizens[indexPath.row]
        cell.citizenNameLabel.text = citizen.name
        cell.citizenDescLabel.text = citizen.catchphrase
        
        let url = URL(string: citizen.imageUrl)
        cell.citizenImageView.kf.setImage(with: url)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCitizenData()
    }
    
    private func getCitizenData() {
        let baseURL = "https://moti.company/api/v2"
        
        AF.request(baseURL+"/citizens").responseJSON(completionHandler: { response in
            guard let data = response.data else {return}
            let citizenModel = try? JSONDecoder().decode(CitizenModel.self, from: data)
            self.citizens = citizenModel?.data.citizens ?? []
            self.tableView.reloadData()
        })
    }
    
}

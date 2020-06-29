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

protocol CitizenDelegate: class {
    func buttonClicked(name: String)
}

class CitizenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var citizens : [Citizen] = []
    weak var delegate: CitizenDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCitizenData()
    }
    
}

extension CitizenViewController {
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


extension CitizenViewController: CitizenTableViewDelegate {
    func buttonClicked(cell: CitizenTableViewCell) {
        let indexPath = tableView.indexPath(for: cell)
        let name = citizens[indexPath!.row].name
        
        delegate?.buttonClicked(name: name)
//        dismiss(animated: true, completion: nil)
    }
    
}

extension CitizenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          citizens.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "CitizenTableViewCell", for: indexPath) as? CitizenTableViewCell else {return.init()}
          let citizen = citizens[indexPath.row]
          
          cell.delegate = self
          cell.setData(data: citizen)
          
          return cell
      }
}

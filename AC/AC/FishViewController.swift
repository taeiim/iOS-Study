//
//  FishViewController.swift
//  AC
//
//  Created by 박태임 on 2020/06/22.
//  Copyright © 2020 taeiim. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class FishViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FishTableViewCell", for: indexPath) as! FishTableViewCell
        let fish = fishModel?[keys[indexPath.row]]
        cell.fishName.text = fish?.name["name-KRko"]
        
        let fishUri = fish?.imageURI
        let url = URL(string: fishUri!)
        cell.fishImageView.kf.setImage(with: url)
        
        cell.fishPhrase.text = fish?.museumPhrase
        
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    var fishModel: FishModel?
    var keys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
    }
    
    func callApi(){
        let baseURL = "http://acnhapi.com"
        
        // Alamofire
        // 비동기로 호출
        // response에 결과값
        AF.request(baseURL + "/v1/fish").responseJSON(completionHandler: { response in
            let decoder = JSONDecoder()
            let fishModel = try! decoder.decode(FishModel.self, from: response.data!)
            self.fishModel = fishModel
            self.keys = fishModel.keys.map { $0 }
            //            for key in fishModel.keys {
            //                self.keys.append(key)
            //            }
            self.tableView.reloadData()
        })
    }
}

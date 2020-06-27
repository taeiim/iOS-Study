//
//  CitizenModel.swift
//  TableViewPracticeAlone
//
//  Created by 박태임 on 2020/06/26.
//  Copyright © 2020 taeiim. All rights reserved.
//

import Foundation

struct CitizenModel: Codable {
    let items: [data]
}

struct data: Codable {
    let name : String
    let catchphrase : String
    let imageUrl : String
}

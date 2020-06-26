//
//  FishModel.swift
//  AC
//
//  Created by 박태임 on 2020/06/22.
//  Copyright © 2020 taeiim. All rights reserved.
//

import Foundation

typealias FishModel = [String:Fish]

struct Fish: Codable {
    let id: Int
    let name: [String: String]
    let price: Int
    let imageURI: String
    let museumPhrase: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, price
        case imageURI = "image_uri"
        case museumPhrase = "museum-phrase"
    }
}

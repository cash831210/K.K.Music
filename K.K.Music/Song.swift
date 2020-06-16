//
//  Song.swift
//  K.K.Music
//
//  Created by 莊鎧旭 on 2020/5/30.
//  Copyright © 2020 Cash. All rights reserved.
//

import Foundation


struct Song: Codable {
    let id: Int
    let file_name: String
    let name: NameData
    let buy_price: Int?
    let sell_price: Int?
    let music_uri: String
    let image_uri: String
    
    enum CodingKeys: String, CodingKey {
    
        case id
        case file_name = "file-name"
        case name
        case buy_price = "buy-price"
        case sell_price = "sell-price"
        case music_uri
        case image_uri
    }
}

struct NameData: Codable {
    
    let name_TWzh: String
    
     enum CodingKeys: String, CodingKey {
        
        case name_TWzh = "name-TWzh"
        
    }
}





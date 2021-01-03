//
//  Model.swift
//  AdApp
//
//  Created by Angelina on 03.01.2021.
//

import Foundation

struct Model: Decodable {
    var result: Result
}

struct Result: Decodable {
    var title: String
    var selectedActionTitle: String
    var list: [List]
}

struct List: Decodable {
    var id: String
    var title: String
    var description: String?
    var icon: Icon
    var price: String
    var isSelected: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case description = "listDescription"
        case icon, price
        case isSelected
    }
}

struct Icon: Decodable {
    var the52X52: String
    
    enum CodingKeys: String, CodingKey {
        case the52X52 = "52x52"
    }
}

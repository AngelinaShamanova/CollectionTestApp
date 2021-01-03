//
//  Model.swift
//  AdApp
//
//  Created by Angelina on 03.01.2021.
//

import Foundation

struct Model: Decodable {
    var result: ResultModel
}

struct ResultModel: Decodable {
    var title: String
    var selectedActionTitle: String
    var list: [List]
}

struct List: Decodable {
    var id: String
    var title: String
    var description: String
    var icon: String
    var price: String
    var isSelected: Bool
}

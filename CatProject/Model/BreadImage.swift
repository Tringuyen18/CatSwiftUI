//
//  BreadImage.swift
//  CatProject
//
//  Created by Trí Nguyễn on 07/12/2021.
//

import Foundation

//"image": {
//      "height": 1445,
//      "id": "0XYvRd7oD",
//      "url": "https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg",
//      "width": 1204
//    },

struct BreadImage: Codable {
    let height: Int?
    let width: Int?
    let id: String?
    let url: String?
}


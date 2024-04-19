//
//  ProductModel.swift
//  MyStoreProject
//
//  Created by Erma on 5/4/24.
//

import Foundation



struct Productts: Codable {
    let products: [Productt]
}

struct Productt: Codable {
    let title: String
}

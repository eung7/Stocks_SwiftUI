//
//  Stock.swift
//  Stocks
//
//  Created by 김응철 on 2022/07/04.
//

import Foundation

struct Stock: Decodable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}

//
//  StockListViewModel.swift
//  Stocks
//
//  Created by 김응철 on 2022/07/04.
//

import Foundation

class StockListViewModel {
    var searchTerm: String = ""
    var stocks = [StockViewModel]()
    
}

struct StockViewModel {
    let stock: Stock
    
    var symbol: String {
        return stock.symbol.uppercased()
    }
    
    var description: String {
        return stock.description
    }
    
    var price: String {
        return String(format: "%.2f", stock.price)
    }
    
    var change: String {
        return stock.change
    }
}

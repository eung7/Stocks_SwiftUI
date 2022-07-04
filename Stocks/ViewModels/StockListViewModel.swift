//
//  StockListViewModel.swift
//  Stocks
//
//  Created by 김응철 on 2022/07/04.
//

import Foundation

class StockListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var stocks = [StockViewModel]()
    @Published var news = [NewsArticleViewModel]()
    
    func load() {
        fetchNews()
        fetchStocks()
    }
    
    private func fetchStocks() {
        WebService().getStocks { stocks in
            DispatchQueue.main.async {
                self.stocks = stocks.map { StockViewModel(stock: $0) }
            }
        }
    }
    
    private func fetchNews() {
        WebService().getTopNews { news in
            self.news = news.map { NewsArticleViewModel(article: $0) }
        }
    }
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

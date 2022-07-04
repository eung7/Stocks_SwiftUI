//
//  WebService.swift
//  Stocks
//
//  Created by 김응철 on 2022/07/04.
//

import Foundation

class WebService {
    func getTopNews(completion: @escaping ([Article]) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let articles = try? JSONDecoder().decode([Article].self, from: data)
            DispatchQueue.main.async {
                if let articles = articles {
                    completion(articles)
                }
            }
        }.resume()
    }
    
    func getStocks(completion: @escaping ([Stock]) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            if let stocks = stocks {
                completion(stocks)
            }
        }.resume()
    }
}

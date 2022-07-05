//
//  ContentView.swift
//  Stocks
//
//  Created by 김응철 on 2022/07/04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var stockListVM = StockListViewModel()
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        stockListVM.load()
    }
    
    var body: some View {
        let filteredStocks = stockListVM.searchTerm.isEmpty ? stockListVM.stocks : stockListVM.stocks.filter { $0.symbol.starts(with: stockListVM.searchTerm) }
        
        return NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                Text("January 5 2022")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(x: 0, y: -350)
                
                SearchView(searchTerm: $stockListVM.searchTerm)
                    .offset(x: 0, y: -300)
                
                StockListView(stocks: filteredStocks)
                    .offset(x: 0, y: 200)
                
                NewsArticleView(newsArticles: stockListVM.news)
                    .offset(x: 0, y: 500)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("Stocks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

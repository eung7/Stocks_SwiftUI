//
//  ContentView.swift
//  Stocks
//
//  Created by 김응철 on 2022/07/04.
//

import SwiftUI

struct ContentView: View {
    @State private var searchTerm: String = ""
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        UITableView.appearance().backgroundColor = UIColor.black
        UITableViewCell.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .leading) {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                Text("January 5 2022")
                    .font(.custom("Arial", size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(x: 0, y: -350)
                
                SearchView(searchTerm: $searchTerm)
                    .offset(x: 0, y: -300)
            }
                .navigationTitle("Stocks")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

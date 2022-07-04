//
//  SearchView.swift
//  Stocks
//
//  Created by 김응철 on 2022/07/04.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchTerm: String
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: "magnifyingglass")
            
            TextField("Search", text: $searchTerm)
                .foregroundColor(Color.accentColor)
                .padding(10)
        }.foregroundColor(Color.primary)
            .background(Color.white)
            .cornerRadius(10)
            .padding(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchTerm: .constant(""))
    }
}

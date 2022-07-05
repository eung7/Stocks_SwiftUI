//
//  NewsArticleView.swift
//  Stocks
//
//  Created by 김응철 on 2022/07/05.
//

import SwiftUI
import URLImage

struct NewsArticleView: View {
    let newsArticles: [NewsArticleViewModel]
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        
        return VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("Top News")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(2)
                
                Text("From Apple News")
                    .foregroundColor(Color.gray)
                    .font(.body)
                    .fontWeight(.bold)
                    .padding(2)
                
                ScrollView {
                    VStack {
                        ForEach(newsArticles, id: \.title)  { article in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(article.publication)
                                        .foregroundColor(Color.white)
                                        .font(.custom("Arial", size: 22))
                                        .fontWeight(.bold)
                                    
                                    Text(article.title)
                                        .font(.custom("Arial", size: 22))
                                        .foregroundColor(Color.white)
                                }
                                Spacer()
                                
                                URLImage(URL(string: article.imageURL)!,
                                         content: { $0.resizable() })
                                .frame(width: 100, height: 100)
                            }
                        }
                    }.frame(maxWidth: .infinity)
                }
                
            }
        }
        .frame(width: screenSize.width, height: screenSize.height)
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(red: 27/255, green: 28/255, blue: 30/255))
        .cornerRadius(20)
    }
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView(newsArticles: [])
    }
}

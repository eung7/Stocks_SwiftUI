//
//  NewsArticleViewModel.swift
//  Stocks
//
//  Created by 김응철 on 2022/07/05.
//

import Foundation

struct NewsArticleViewModel {
    let article: Article
    
    var imageURL: String {
        return article.imageURL
    }
    
    var title: String {
        return article.title
    }
    
    var publication: String {
        return article.publication.uppercased()
    }
}

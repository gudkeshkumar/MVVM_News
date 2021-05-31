//
//  HeadlinesViewModel.swift
//  MVVM_News
//
//  Created by apple on 31/05/21.
//

import Foundation

struct HeadlinesListViewModel {
    private let articles: [Article]
}

extension HeadlinesListViewModel {
    init(_ articles: [Article]) {
        self.articles = articles
    }
    
    var numberOfSections: Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        articles.count
    }
    
    func headline(at index: Int) -> HeadlineViewModel? {
        guard index < articles.count else { return nil }
        return HeadlineViewModel(articles[index])
    }
}

struct HeadlineViewModel {
    private let article: Article
}

extension HeadlineViewModel {
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title: String {
        article.title
    }
    
    var description: String {
        article.description
    }
    
}

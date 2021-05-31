//
//  HeadlinesModel.swift
//  MVVM_News
//
//  Created by apple on 31/05/21.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
    
    private enum DecodingKeys: String, CodingKey {
        case articles
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: DecodingKeys.self)
        articles = try container.decodeIfPresent([Article].self, forKey: .articles) ?? []
    }
}

struct Article: Decodable {
    let title: String
    let description: String
    
    private enum DecodingKeys: String, CodingKey {
        case title
        case description
    }
    
    init(from decoder: Decoder) throws {
        let container = try! decoder.container(keyedBy: DecodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
    }
}

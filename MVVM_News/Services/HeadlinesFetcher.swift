//
//  HeadlinesFetcher.swift
//  MVVM_News
//
//  Created by apple on 31/05/21.
//

import Foundation

final class HeadlinesFetcher {
    
    func getHeadlines(url: URL, completion: @escaping ([Article]) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data{
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                completion(articleList?.articles ?? [])
            }
            
        }.resume()
    }
}

//
//  NewsRepo.swift
//  News
//
//  Created by TTNPL-3940 on 07/01/24.
//

import Foundation

class NewsRepo {
    
    private let newsDb = NewsDB.db
    
    func getHeadlines(result: @escaping ([NewsItem]?) -> ()) {
        result(newsDb.fetchNews())
        guard let url = URL(string: Constants.HEADLINES_URL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            let newsResponse = try? JSONDecoder().decode(NewsResponse.self, from: data)
            if let newsResponse = newsResponse {
                var news: [NewsItem] = []
                for article in newsResponse.articles {
                    let newsItem = NewsItem(author: article.author ?? "", title: article.title ?? "", desc: article.description ?? "", imageUrl: article.urlToImage ?? "", timeStamp: Date())
                    news.append(newsItem)
                }
                self.newsDb.addNews(news: news)
            }
            result(self.newsDb.fetchNews())
        }.resume()
    }
}

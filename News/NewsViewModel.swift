//
//  NewsViewModel.swift
//  News
//
//  Created by TTNPL-3940 on 07/01/24.
//

import Foundation

class NewsViewModel: ObservableObject {
    
    private let newsRepo = NewsRepo()
    
    @Published
    var news: [NewsItem] = []
    
    init() {
        fetchHeadlines()
    }
    
    private func fetchHeadlines() {
        newsRepo.getHeadlines() { result in
            if let result = result {
                DispatchQueue.main.async {
                    self.news = result
                }
            }
        }
    }
}

//
//  NewsResponse.swift
//  News
//
//  Created by TTNPL-3940 on 07/01/24.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let publishedAt: String?
}

//
//  NewsItem.swift
//  News
//
//  Created by TTNPL-3940 on 06/01/24.
//

import Foundation
import SwiftData

@Model
final class NewsItem {
    var author: String
    @Attribute(.unique) var title: String
    var desc: String
    var imageUrl: String
    var timeStamp: Date
    
    init(author: String, title: String, desc: String, imageUrl: String, timeStamp: Date) {
        self.author = author
        self.title = title
        self.desc = desc
        self.imageUrl = imageUrl
        self.timeStamp = timeStamp
    }
}

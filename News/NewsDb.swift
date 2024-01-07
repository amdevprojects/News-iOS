//
//  NewsDb.swift
//  News
//
//  Created by TTNPL-3940 on 07/01/24.
//

import Foundation
import SwiftData

final class NewsDB {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let db = NewsDB()
    
    @MainActor
    init() {
        let schema = Schema([
            NewsItem.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        self.modelContainer = try! ModelContainer(for: schema, configurations: [modelConfiguration])
        self.modelContext = modelContainer.mainContext
    }
    
    func addNews(news: [NewsItem]) {
        do {
            try modelContext.transaction {
                for newsItem in news {
                    modelContext.insert(newsItem)
                }
                try modelContext.save()
            }
        } catch {
            print(".\(error)")
        }
    }
    
    func fetchNews() -> [NewsItem] {
        do {
            return try modelContext.fetch(FetchDescriptor<NewsItem>())
        } catch {
            print(".\(error)")
        }
        return []
    }
}

//
//  ContentView.swift
//  News
//
//  Created by TTNPL-3940 on 06/01/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @ObservedObject
    var viewModel = NewsViewModel()

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.news) { newsItem in
                    NewsRow(newsItem: newsItem)
                }
            }.navigationTitle("News")
        }
    }
}

#Preview {
    ContentView()
}

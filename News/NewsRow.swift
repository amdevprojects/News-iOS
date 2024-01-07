//
//  NewsRow.swift
//  News
//
//  Created by TTNPL-3940 on 07/01/24.
//

import SwiftUI

struct NewsRow: View {
    let newsItem: NewsItem
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: newsItem.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            
            Text(newsItem.title)
                .font(.title3)
        }
    }
}

#Preview {
    NewsRow(
        newsItem: NewsItem(author: "Author", title: "Title", desc: "Description", imageUrl: "Image Url", timeStamp: Date())
    )
}

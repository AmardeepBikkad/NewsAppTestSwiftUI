//
//  NewsListView.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var viewModel: NewsFeedViewModel

    var body: some View {
        NavigationView {
            // 1. Use a List to display news articles.
            List(viewModel.newsArray) { newsArticle in
                // 2. Each article cell should show an image,title, and description.
                AsyncImage(url: URL(string: newsArticle.urlToImage ?? "")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                    } else {
                        ProgressView()
                    }
                }
                .cornerRadius(15)
                .frame(width: 300, height: 300, alignment: .center)
                VStack(alignment: .leading) {
                    Text(newsArticle.title ?? "").font(.title3)
                    Text(newsArticle.description ?? "").font(.caption2)
                }
            }
            .task {
                await viewModel.loadNewsFeed()
            }
            // 3. Implement navigation to a detail view on selection.
            .onTapGesture {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(viewModel: NewsFeedViewModel())
    }
}


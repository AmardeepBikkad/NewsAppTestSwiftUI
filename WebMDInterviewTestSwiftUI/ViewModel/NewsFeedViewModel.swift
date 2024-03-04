//
//  NewsFeedViewModel.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import Foundation
import Combine

class NewsFeedViewModel: ObservableObject {
    @Published var newsArray = [NewsArticle]()
    
    private var newsListViewService: NewsListViewServiceDelegate
    
    init(newsListViewService: NewsListViewServiceDelegate = NewsListViewService()) {
        self.newsListViewService = newsListViewService
    }
    
    // Function to load news feed
    func loadNewsFeed() {
        // fetchNews and handle its response
        newsListViewService.fetchNews { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let newsArticles):
                    if newsArticles.count > 5 {
                        self.newsArray.append(contentsOf: Array(newsArticles[0..<5]))
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    // Please show only the first 25 articles
}

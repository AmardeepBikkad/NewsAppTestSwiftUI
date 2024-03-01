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
    
    // Function to load news feed
    func loadNewsFeed() async {
        // fetchNews and handle its response
        await NewsAPI.fetchNews { result in
            switch result {
            case .success(let newsArticles):
                if newsArticles.count > 5 {
                    self.newsArray.append(contentsOf: Array(newsArticles[0..<5]))
                }
                print(self.newsArray)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    // Please show only the first 25 articles
}

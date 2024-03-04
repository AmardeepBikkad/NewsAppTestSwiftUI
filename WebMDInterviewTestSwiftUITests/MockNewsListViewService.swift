//
//  MockNewsListViewService.swift
//  WebMDInterviewTestSwiftUITests
//
//  Created by Amardeep Bikkad on 02/03/24.
//

import Foundation
@testable import WebMDInterviewTestSwiftUI

class MockNewsListViewService: NewsListViewServiceDelegate {
    func fetchNews(completion: @escaping (Result<[WebMDInterviewTestSwiftUI.NewsArticle], Error>) -> Void) {
        
    }
    
    var result: Result<[NewsArticle], Error>!
    
    func fetchNews(completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        completion(result)
    }
    
    func getNewsFeed() -> [NewsArticle]? {
        do {
            guard let fileUrl = Bundle.main.url(forResource: "NewsArticles", withExtension: "json") else { return nil }
            let data = try Data(contentsOf: fileUrl)
            return try? JSONDecoder().decode([NewsArticle].self, from: data)
        } catch {
            return nil
        }
    }
}

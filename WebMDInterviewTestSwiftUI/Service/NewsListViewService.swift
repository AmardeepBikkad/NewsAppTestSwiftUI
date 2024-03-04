//
//  File.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Amardeep Bikkad on 02/03/24.
//

import Foundation

protocol NewsListViewServiceDelegate {
    func fetchNews(completion: @escaping (Result<[NewsArticle], Error>) -> Void)
}

class NewsListViewService: NewsListViewServiceDelegate {
    func fetchNews(completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        NewsAPI.fetchNews(completion: completion)
    }
}

//
//  NewsAPI.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import Foundation
import Combine

struct NewsAPI {
    static let apiKey = "90cb3a480ee245afb759b8e17c6de0b8"
    static let baseURL = "https://newsapi.org"
    static let params = "/v2/everything?q=tesla&sortBy=publishedAt&apiKey="

    // Function to fetch news from the API
    static func fetchNews(completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        // 1. Construct the URL with the correct parameters.
        guard let url = URL(string: baseURL+params+apiKey) else {
            print("Invalid URL")
            return
        }
       
        // 2. Perform a URLSession data task to fetch the news.
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                // 3. Decode the JSON response into an array of NewsArticle.
                if let decodedResponse = try? JSONDecoder().decode(NewsApiResult.self, from: data) {
                    // 4. Call the completion handler with the fetched articles or an error.
                    completion(.success(decodedResponse.articles ?? []))
                }
            } catch {
                completion(.failure(Never.self as! Error))
                print("Invalid data")
            }
        }
    }
}

enum NetworkError: Error {
    case failedLoading
    
    var description: String {
        switch self {
        case .failedLoading:
            return "Failed loading data"
        }
    }
}

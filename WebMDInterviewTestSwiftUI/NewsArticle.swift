//
//  NewsArticle.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import Foundation

struct NewsApiResult: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [NewsArticle]?
    
    enum codingKeys: String, CodingKey {
        case status, totalResults, articles
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try? container.decodeIfPresent(String.self, forKey: .status)
        self.totalResults = try? container.decodeIfPresent(Int.self, forKey: .totalResults)
        self.articles = try? container.decodeIfPresent([NewsArticle].self, forKey: .articles)
    }
}

struct NewsArticle: Identifiable, Codable {
    var id = UUID()
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    // Add other properties as needed based on the News API response.
    
    enum codingKeys: String, CodingKey {
        case source, author, title, description, url, urlToImage, publishedAt, content
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try? container.decodeIfPresent(Source.self, forKey: .source)
        self.author = try? container.decodeIfPresent(String.self, forKey: .author)
        self.title = try? container.decodeIfPresent(String.self, forKey: .title)
        self.description = try? container.decodeIfPresent(String.self, forKey: .description)
        self.url = try? container.decodeIfPresent(String.self, forKey: .url)
        self.urlToImage = try? container.decodeIfPresent(String.self, forKey: .urlToImage)
        self.publishedAt = try? container.decodeIfPresent(String.self, forKey: .publishedAt)
        self.content = try? container.decodeIfPresent(String.self, forKey: .content)
    }
}

struct Source: Codable {
    var id: String?
    let name: String?
    
    enum codingKeys: String, CodingKey {
        case id, name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try? container.decodeIfPresent(String.self, forKey: .id)
        self.name = try? container.decodeIfPresent(String.self, forKey: .name)
    }
}

//
//  NewsArticleView.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import SwiftUI

struct NewsArticleView: View {
    var newsArticle: NewsArticle?
    
    var body: some View {
        ScrollView {
            // Display the article's image at the top (if available).
            // Show the article's title.
            // Show the full description of the article.
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 10) {
                    AsyncImage(url: URL(string: newsArticle?.urlToImage ?? "")) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                        }
                    }
                    .cornerRadius(15)
                    .frame(width: geometry.size.width, height: 400, alignment: .center)
                    VStack(alignment: .leading) {
                        if shouldShowText(newsArticle?.author ?? "") {
                            Text("Author: \(newsArticle?.author ?? "")")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                        if shouldShowText(newsArticle?.publishedAt ?? "") {
                            Text("Date: \(newsArticle?.publishedAt ?? "")")
                                .font(.caption)
                                .fontWeight(.bold)
                        }
                    }
                    
                    VStack() {
                        Text(newsArticle?.title ?? "")
                            .font(.title3).bold()
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                        Text(newsArticle?.description ?? "")
                            .font(.body)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                
            }
            // Style the view to ensure it is user-friendly and matches the design aesthetic.
            // Optionally, add more elements or information as needed.
        }.padding()
    }
    
    private func shouldShowText(_ inputString: String) -> Bool {
        return inputString != "" && inputString != nil
    }
    
}

struct NewsArticleView_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticleView(newsArticle: nil)
    }
}

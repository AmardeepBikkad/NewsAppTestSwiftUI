//
//  NewsFeedViewModelTests.swift
//  WebMDInterviewTestSwiftUITests
//
//  Created by Amardeep Bikkad on 02/03/24.
//

import XCTest
import Combine
@testable import WebMDInterviewTestSwiftUI

class NewsFeedViewModelTests: XCTestCase {
    
    func test_newsAPI_Success() {
        let mockServive = MockNewsListViewService()
        guard let newsArticle = mockServive.getNewsFeed() else { return }
        mockServive.result = .success(newsArticle)
        let newsFeedModel = NewsFeedViewModel(newsListViewService: mockServive)
        newsFeedModel.loadNewsFeed()
        XCTAssert(!newsFeedModel.newsArray.isEmpty)
        
        
        //We are assigning array in dispatchQueue.main.async, so we get test cases passed or failed. For this we can use WAIT FOR EXPECTATIONS or just comment out dispatch queue
//        let expectation = XCTestExpectation(description: "fetching news feeds")
//        var cancellable: AnyCancellable?
//        cancellable = newsFeedModel.$newsArray
//            .dropFirst()
//            .sink(receiveValue: { value in
//                expectation.fulfill()
//            })
//        newsFeedModel.loadNewsFeed()
//        wait(for: [expectation], timeout: 3)
//        XCTAssert(!newsFeedModel.newsArray.isEmpty)
    }
    
    func test_newsAPI_Failure() {
        let mockServive = MockNewsListViewService()
        mockServive.result = .failure(NetworkError.failedLoading)
        let newsFeedModel = NewsFeedViewModel(newsListViewService: mockServive)
        newsFeedModel.loadNewsFeed()
        XCTAssert(newsFeedModel.newsArray.isEmpty)
    }
}


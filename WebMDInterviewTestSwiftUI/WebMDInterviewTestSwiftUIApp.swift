//
//  WebMDInterviewTestSwiftUIApp.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import SwiftUI

@main
struct WebMDInterviewTestSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NewsListView(viewModel: NewsFeedViewModel())
        }
    }
}

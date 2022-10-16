//
//  NewsListViewModel.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 14.10.2022.
//

import SwiftUI

final class NewsListViewModel: ObservableObject {
    
    var navigationTitleText = "Ukraine News"
    @Published var news: [Article] = []
    @Published var isLoading = false
    @Published var selectedNews: Article?
    @Published var searchText = ""
    @Published var updatedArticles: [Article] = []
    @Published var isShowinfSafariView = false
    
    func getNews() {
        isLoading = true
        NetworkManager.shared.getNews { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success(let news):
                    self.news = news
                case.failure(let error):
                    print(error)
                }
            }
        }
    }
    
    func getSearchResult(with searchValue: String) {
        updatedArticles = news.filter { $0.title.contains(searchValue)}
    }
    
    func showNewsInSafari() -> SafariView? {
        guard let url = URL(string: selectedNews?.url ?? "") else { return nil }
        return SafariView(url: url)
    }
}


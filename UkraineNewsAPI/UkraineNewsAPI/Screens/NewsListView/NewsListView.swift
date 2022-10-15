//
//  NewsListView.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 14.10.2022.
//

import SwiftUI

struct NewsListView: View {
    
    @StateObject var viewModel = NewsListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.searchText == "" ? viewModel.news : viewModel.updatedArticles) { news in
                NewsListCell(article: news)
                    .onTapGesture {
                        viewModel.selectedNews = news
                        viewModel.isShowinfSafariView = true
                    }
                    .listRowSeparatorTint(.gray)
            }
            .listStyle(.plain)
            .navigationTitle(("Ukraine News"))
            .searchable(text: $viewModel.searchText)
        }
        .fullScreenCover(isPresented: $viewModel.isShowinfSafariView) {
            SafariView(url: URL(string: viewModel.selectedNews?.url ?? "") ?? URL(string: "")!)
        }
        .onAppear {
            viewModel.getNews()
        }
        .onChange(of: viewModel.searchText) { searchValue in
            viewModel.updatedArticles = viewModel.news.filter { $0.title.contains(searchValue)}
        }
        
        if viewModel.isLoading {
            LoadingView(alingment: .top)
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}

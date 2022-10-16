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
                NewsListCell(article: news, viewModel: viewModel)
            }
            .listStyle(.plain)
            .navigationTitle((viewModel.navigationTitleText))
            .searchable(text: $viewModel.searchText)
        }
        .onAppear {
            viewModel.getNews()
        }
        .onChange(of: viewModel.searchText) { searchValue in
            withAnimation {
                viewModel.getSearchResult(with: searchValue)
            }
        }
        .fullScreenCover(isPresented: $viewModel.isShowinfSafariView) {
            viewModel.showNewsInSafari()
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

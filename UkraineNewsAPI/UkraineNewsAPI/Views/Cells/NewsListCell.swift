//
//  NewsListCell.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 14.10.2022.
//

import SwiftUI

struct NewsListCell: View {
    
    let article: Article
    @StateObject var viewModel: NewsListViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            
            NewsRemoteImage(urlString: article.urlToImage ?? "")
            
            Text(article.title)
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(3)
            
            HStack {
                Text(article.description ?? "")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(4)
                    .frame(width: 315, alignment: .leading)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 30))
                    .onTapGesture {
                        viewModel.selectedNews = article
                        viewModel.isShowinfSafariView = true
                    }
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(article.author ?? "")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                HStack {
                    Text(article.source.name)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text(article.publishedAt.formattedDate())
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListCell(article: MockData.sampleNews, viewModel: NewsListViewModel())
    }
}

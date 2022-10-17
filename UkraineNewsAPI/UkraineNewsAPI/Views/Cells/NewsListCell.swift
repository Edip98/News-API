//
//  NewsListCell.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 14.10.2022.
//

import SwiftUI

struct NewsListCell: View {
    
    let article: Article
    @State private var animationAmount = 1.0
    @ObservedObject var viewModel: NewsListViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            
            NewsRemoteImage(urlString: article.urlToImage ?? "")
            
            Text(article.title)
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(3)
            
            HStack {
                Text(article.description ?? "На жаль, опис відсутній. Щоб дізнатися докладніше, натисніть стрілочку.")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(4)
                    .frame(width: 315, alignment: .leading)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
                    .font(.system(size: 25))
                    .scaleEffect(animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: true),
                        value: animationAmount
                    )
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
        .onAppear {
            animationAmount += 0.5
        }
        .onDisappear {
            animationAmount -= 0.5
        }
    }
}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListCell(article: MockData.sampleNews, viewModel: NewsListViewModel())
    }
}

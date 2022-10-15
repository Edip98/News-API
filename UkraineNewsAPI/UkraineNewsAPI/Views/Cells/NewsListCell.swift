//
//  NewsListCell.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 14.10.2022.
//

import SwiftUI

struct NewsListCell: View {
    
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            NewsRemoteImage(urlString: article.urlToImage ?? "")
            
            Text(article.title)
                .font(.title3)
                .fontWeight(.bold)
                .lineLimit(3)
            
            HStack {
                Text(article.description ?? "")
                    .lineLimit(4)
                    .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 25))
            }
            
            Text(article.author ?? "")
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
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct NewsListCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsListCell(article: MockData.sampleNews)
    }
}

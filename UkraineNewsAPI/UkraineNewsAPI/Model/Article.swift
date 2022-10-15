//
//  Article.swift
//  UkraineNewsAPI
//
//  Created by Эдип on 14.10.2022.
//

import Foundation

struct APIResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable, Identifiable {
    let source: Source
    var id: String { url }
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Decodable {
    let name: String
}

struct MockData {
    
    static let sampleNews = Article(source: Source(name: "Unian.ua"), author: "Денис Пономаренко", title: "Від дефіциту до надлишку: у 2023 очікується дворазове падіння цін на SSD-накопичувачі - УНІАН", description: "Від дефіциту до надлишку: у 2023 очікується дворазове падіння цін на SSD-накопичувачі - УНІАН", url: "https://www.unian.ua/techno/vid-deficitu-do-nadlishku-u-2023-ochikuyetsya-dvorazove-padinnya-cin-na-ssd-nakopichuvachi-12011334.html", urlToImage: "https://images.unian.net/photos/2022_10/thumb_files/1000_545_1665743806-3322.jpg?1", publishedAt: "2022-10-14T10:41:00Z")
    
    
    static let appetizers = [sampleNews, sampleNews, sampleNews, sampleNews, sampleNews, sampleNews, sampleNews, sampleNews]
}

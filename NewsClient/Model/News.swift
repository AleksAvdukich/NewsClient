//
//  News.swift
//  NewsClient
//
//  Created by Aleksandr Avdukich on 24.10.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import Foundation

/*struct News: Decodable {
 let status:      String
 let totalResult: Int
 let articles:    [Article]
 
 struct Article: Decodable {
 let source: Source
 let author, title, description: String?
 let url, urlToImage, publishedAt, content: String
 
 struct Source: Codable {
 let id: String
 let name: String
 }
 }
 }*/


struct Welcome: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let author: String
    let title: String
    let articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case articleDescription = "description"
        case url
        case urlToImage
        case publishedAt
        case content
    }
    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(source, forKey: .source)
//        try container.encode(author, forKey: .author)
//        try container.encode(title, forKey: .title)
//        try container.encode(articleDescription, forKey: .articleDescription)
//        try container.encode(url, forKey: .url)
//        try container.encode(urlToImage, forKey: .urlToImage)
//        try container.encode(publishedAt, forKey: .publishedAt)
//        try container.encode(content, forKey: .content)
//    }
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        source = try container.decode(Source.self, forKey: .source)
//        author = try container.decode(String.self, forKey: .author)
//        title = try container.decode(String.self, forKey: .title)
//        articleDescription = try container.decode(String.self, forKey: .articleDescription)
//        url = try container.decode(String.self, forKey: .url)
//        urlToImage = try container.decode(String.self, forKey: .urlToImage)
//        publishedAt = try container.decode(Date.self, forKey: .publishedAt)
//        content = try container.decode(String.self, forKey: .content)
//    }
}


struct Source: Codable {
    let id: String?
    let name: String
}

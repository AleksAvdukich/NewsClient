//
//  APIService.swift
//  NewsClient
//
//  Created by Aleksandr Avdukich on 24.10.2020.
//  Copyright © 2020 Aleksandr Avdukich. All rights reserved.
//

import Foundation

enum CustomErrors: Error {
    case failureUrl
    case serverError
    
    var description: String {
        switch self {
        case .failureUrl:  return "Неверный URL"
        case .serverError: return "Сервис временно недоступен. Пожалуйста, повторите попытку позже."
        }
    }
}

class APIService {
    
    static let shared = APIService()
    
    func fetchNews(completionHandler: @escaping(Swift.Result<[Article], CustomErrors>) -> ()) {
        
        let baseUrl = "https://newsapi.org/v2/everything/?q=apple&sortBy=popularity&language=ru&apiKey=adcdc"
        
        guard let url = URL(string: baseUrl) else {
            completionHandler(.failure(CustomErrors.failureUrl))
            return
        }
        print("!!! 1", Thread.current)
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            print("!!! 2", Thread.current)
            guard let data = data else { return }
            
            do {
                let newsResult = try JSONDecoder().decode(Welcome.self, from: data)
                completionHandler(.success(newsResult.articles))
            } catch let jsonErr {
                let error = CustomErrors.serverError
                completionHandler(.failure(error))
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
}

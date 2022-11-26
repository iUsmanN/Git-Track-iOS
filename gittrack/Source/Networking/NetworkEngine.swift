//
//  NetworkEngine.swift
//  gittrack
//
//  Created by Usman on 18/11/2022.
//

import Foundation
import Combine

protocol NetworkEngine {}

extension NetworkEngine {
    
    func networkRequest<T: Codable>(endpoint: Endpoint) -> Future<T, AppError> {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme.rawValue
        components.host = endpoint.host.rawValue
        components.path = endpoint.path.rawValue
        components.queryItems = endpoint.parameters?.map({ row in return URLQueryItem(name: row.key, value: row.value) })
        
        guard let url = components.url else { return Future { promise in promise(.failure(.networkEngineFailure)) }}
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        urlRequest.setValue("Bearer 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", forHTTPHeaderField: "Authorization")
        
        return Future() { promise in
            let session = URLSession(configuration: .default)
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                guard error == nil else { return }
                guard response != nil else { return }
                guard let data = data else { return }
                let str = String(decoding: data, as: UTF8.self) //For Debug
                guard let responseObject = try? JSONDecoder().decode(T.self, from: data) else { return }
                promise(.success(responseObject))
            }
            dataTask.resume()
        }
    }
}

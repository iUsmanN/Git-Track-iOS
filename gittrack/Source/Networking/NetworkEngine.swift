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
    
    func networkRequest<T: Codable>(endpoint: Endpoint) async -> Result<T, AppError> {
        
        var components = URLComponents()
        components.scheme = endpoint.scheme.rawValue
        components.host = endpoint.host.rawValue
        components.path = endpoint.path.rawValue
        components.queryItems = endpoint.parameters?.map({ row in return URLQueryItem(name: row.key, value: row.value) })
        
        guard let url = components.url else { return .failure(.networkEngineFailure)}
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = endpoint.method.rawValue
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")
        urlRequest.setValue("Bearer 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", forHTTPHeaderField: "Authorization")
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let response = response as? HTTPURLResponse else { return .failure(.networkEngineFailure)}
            guard response.statusCode == 200 else { return .failure(.networkEngineFailure)}
            let str = String(decoding: data, as: UTF8.self)
            guard let responseObject = try? JSONDecoder().decode(T.self, from: data) else { return .failure(.networkEngineFailure)}
            return.success(responseObject)
        } catch {
            return .failure(.networkEngineFailure)
        }
    }
}

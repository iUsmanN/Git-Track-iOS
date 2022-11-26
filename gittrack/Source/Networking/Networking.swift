//
//  Networking.swift
//  gittrack
//
//  Created by Usman on 18/11/2022.
//

import Foundation

enum Networking {
    
    enum Host: String {
        case baseUrl = "api.github.com"
    }
    
    enum Scheme: String {
        case https = "https"
    }
    
    enum Path {
        case PRs((String, String))
        case User
        case PRReview((String, String, Int))
        
        var rawValue: String {
            switch self {
            case .PRs(let (owner, repo)):
                return "/repos/\(owner)/\(repo)/pulls"
            case .User:
                return "/user"
            case .PRReview(let (owner, repo, id)):
                return "/repos/\(owner)/\(repo)/pulls/\(id)/reviews"
            }
        }
    }
    
    enum HTTPMethod : String {
        case get = "GET"
    }
}

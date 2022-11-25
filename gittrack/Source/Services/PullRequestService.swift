//
//  PullRequestService.swift
//  gittrack
//
//  Created by Usman on 18/11/2022.
//

import Foundation
import Combine

struct PRObject: Codable {
    var number: Int
    var title: String
}

protocol PullRequestService: NetworkEngine {}

extension PullRequestService {
    
    func getPRs() -> Future<PRObject, AppError> {
        let endpoint = Endpoint(scheme: .https, host: .baseUrl, path: .PRs, method: .get)
        return networkRequest(endpoint: endpoint)
    }
}

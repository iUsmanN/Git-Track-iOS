//
//  PullRequestService.swift
//  gittrack
//
//  Created by Usman on 18/11/2022.
//

import Foundation
import Combine

protocol PullRequestService: NetworkEngine {}

extension PullRequestService {
    
    func getPRs(repo: GithubRepo) -> Future<[PRObject], AppError> {
        let endpoint = Endpoint(scheme: .https, host: .baseUrl, path: .PRs((repo.owner, repo.name)), method: .get)
        return networkRequest(endpoint: endpoint)
    }
    
    func getReview(repo: GithubRepo, id: PullRequestID) -> Future<[PRReviewStatus], AppError> {
        let endpoint = Endpoint(scheme: .https, host: .baseUrl, path: .PRReview((repo.owner, repo.name, id)), method: .get)
        return networkRequest(endpoint: endpoint)
    }
}

extension PullRequestService {
    
    func getAuthoredPRs() {
        
    }
}

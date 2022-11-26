//
//  PullRequestService.swift
//  gittrack
//
//  Created by Usman on 18/11/2022.
//

import Foundation
import Combine

typealias PullRequestID = Int

struct GithubRepo {
    let owner: String
    let name: String
}

struct GithubUser: Codable {
    var login: String
}

struct PRObject: Codable {
    var number: Int
    var title: String
    var user: GithubUser
    var assignees: [GithubUser]?
}

struct PRReviewStatus: Codable {
    var state: String
}

protocol PullRequestService: NetworkEngine {}

extension PullRequestService {
    
    func getPRs(repo: GithubRepo) -> Future<[PRObject], AppError> {
        let endpoint = Endpoint(scheme: .https, host: .baseUrl, path: .PRs((repo.owner, repo.name)), method: .get)
        return networkRequest(endpoint: endpoint)
    }
    
    func getUser() -> Future<GithubUser, AppError> {
        let endpoint = Endpoint(scheme: .https, host: .baseUrl, path: .User, method: .get)
        return networkRequest(endpoint: endpoint)
    }
    
    func getReview(repo: GithubRepo, id: PullRequestID) -> Future<[PRReviewStatus], AppError> {
        let endpoint = Endpoint(scheme: .https, host: .baseUrl, path: .PRReview((repo.owner, repo.name, id)), method: .get)
        return networkRequest(endpoint: endpoint)
    }
}

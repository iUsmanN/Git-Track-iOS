//
//  PullRequest.swift
//  gittrack
//
//  Created by Usman on 18/11/2022.
//

import Foundation

typealias PullRequestID = Int

struct PullRequest: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var creator: String
    var status: PRStatus
}

struct PRObject: Codable {
    var number: Int
    var title: String
    var user: GithubUser
    var assignees: [GithubUser]?
}

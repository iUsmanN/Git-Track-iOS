//
//  PullRequestsViewModel.swift
//  gittrack
//
//  Created by Usman on 23/11/2022.
//

import Foundation
import SwiftUI
import OctoKit
import Combine

@MainActor class PullRequestsViewModel: ObservableObject {
    
    @Published var sections = ["Authored PRs", "Assigned PRs", "Draft PRs"]
    @Published var model = [
        [PullRequest](), //My PRs
        [PullRequest](), //Assigned
        [PullRequest]()  //Drafts
    ]
    
    func loadPRs() {
        Octokit().pullRequests(owner: "iUsmanN", repository: "CrowdCast_iOS") { response in
            switch response {
            case .success(let prs):
                self.model[0] = prs.filter({$0.user?.login ?? "" == "iUsmanN"}).map { inputPR in
                    return PullRequest(name: inputPR.title ?? "XX", creator: inputPR.user?.login ?? "XX", status: .review)
                }
                self.model[1] = prs.filter({$0.assignee?.login ?? "" == "iUsmanN"}).map { inputPR in
                    return PullRequest(name: inputPR.title ?? "XX", creator: inputPR.user?.login ?? "XX", status: .review)
                }
                
                self.model[1].append(PullRequest(name: "Sample PR", creator: "Also Usman", status: .attention))
                self.model[1].append(PullRequest(name: "Sample PR", creator: "Also Usman", status: .blocked))
                
                self.model[2].append(PullRequest(name: "Sample PR", creator: "Also Usman", status: .draft))
                self.model[2].append(PullRequest(name: "Sample PR", creator: "Also Usman", status: .draft))
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension PullRequestsViewModel: PullRequestService {
    
    func fetchPRs() {
        
    }
}

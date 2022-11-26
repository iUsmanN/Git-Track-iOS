//
//  LoginView.swift
//  gittrack
//
//  Created by Usman on 23/11/2022.
//

import SwiftUI
import OctoKit

struct LoginView: View {
    var body: some View {
        VStack {
            Button("Login") {
                Login()
            }
            Button("PRs") {
                prs()
            }
        }
    }
    
    private func Login() {
//        let config = TokenConfiguration("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")
//        loadCurrentUser(config: config)
        
        //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
//        getPRs(repo: GithubRepo(owner: "guardian", name: "ios-live"))
//        getUser()
        getReview(repo: GithubRepo(owner: "guardian", name: "ios-live"), id: 6652)
        
    }
    
    func loadCurrentUser(config: TokenConfiguration) {
      Octokit(config).me() { response in
        switch response {
        case .success(let user):
          print(user.login)
        case .failure(let error):
          print(error)
        }
      }
    }
    
    func prs() {
        Octokit().pullRequests(owner: "iUsmanN", repository: "CrowdCast_iOS") { response in
            switch response {
            case .success(let prs):
                print(prs)
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView: PullRequestService {
    
}

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
        Task(priority: .medium) {
//            let result = await getUser()
            let result = await getReview(repo: GithubRepo(owner: "guardian", name: "ios-live"), id: 6644)
//            let result = await getPRs(repo: GithubRepo(owner: "guardian", name: "ios-live"))
            print(result)
        }
        
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

extension LoginView: PullRequestService, UserService {
    
}

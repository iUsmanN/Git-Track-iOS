//
//  UserService.swift
//  gittrack
//
//  Created by Usman on 26/11/2022.
//

import Foundation
import Combine

protocol UserService: NetworkEngine {}

extension UserService {
    
    func getUser() -> Future<GithubUser, AppError> {
        let endpoint = Endpoint(scheme: .https, host: .baseUrl, path: .User, method: .get)
        return networkRequest(endpoint: endpoint)
    }
}

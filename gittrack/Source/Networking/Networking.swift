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
    
    enum Endpoint: String {
        case companyInfo = "/v4/company"
        case launches = "/v4/launches"
        
        case PRs = "/repos/iUsmanN/cyty_ios/pulls"
    }
    
    enum HTTPMethod : String {
        case get = "GET"
    }
}

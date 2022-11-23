//
//  Networking.swift
//  gittrack
//
//  Created by Usman on 18/11/2022.
//

import Foundation

enum Networking {
    
    enum Host: String {
        case baseUrl = "api.spacexdata.com"
    }
    
    enum Scheme: String {
        case https = "https"
    }
    
    enum Endpoint: String {
        case companyInfo = "/v4/company"
        case launches = "/v4/launches"
    }
    
    enum HTTPMethod : String {
        case get = "GET"
    }
}

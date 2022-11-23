//
//  Endpoint.swift
//  gittrack
//
//  Created by Usman on 18/11/2022.
//

import Foundation

struct Endpoint {
    var scheme  : Networking.Scheme
    var host    : Networking.Host
    var path    : Networking.Endpoint
    var method  : Networking.HTTPMethod
    var parameters  : [String:String]?
}

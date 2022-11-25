//
//  PRTrackingAttributes.swift
//  gittrack
//
//  Created by Usman on 24/11/2022.
//

import Foundation
import ActivityKit

struct PRTrackingAttributes: ActivityAttributes {
    public typealias PRTrackingStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var status: PRStatus
    }
    
    var name: String
    var author: String
}

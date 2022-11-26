//
//  PRStatus.swift
//  gittrack
//
//  Created by Usman on 26/11/2022.
//

import Foundation

struct PRReviewStatus: Codable {
    var state: String
}

enum PRStatus: String, Codable {
    case draft = "DRAFT"
    case review = "IN REVIEW"
    case blocked = "BLOCKED"
    case attention = "APPROVED"
}

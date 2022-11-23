//
//  PullRequest.swift
//  gittrack
//
//  Created by Usman on 18/11/2022.
//

import Foundation

enum PRStatus {
    case draft
    case review
    case blocked
    case attention
}

struct PullRequest: Identifiable {
    let id = UUID()
    var name: String
    var creator: String
    var status: PRStatus
}

//struct Bookmark: Identifiable {
//    let id = UUID()
//    let name: String
//    let icon: String
//    var items: [Bookmark]?
//
//    // some example websites
//    static let apple = Bookmark(name: "Apple", icon: "1.circle")
//    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
//    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
//    static let twitter = Bookmark(name: "Twitter", icon: "mic")
//
//    // some example groups
//    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
//    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
//    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
//}

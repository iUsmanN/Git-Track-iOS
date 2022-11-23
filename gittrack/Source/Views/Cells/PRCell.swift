//
//  PRCell.swift
//  gittrack
//
//  Created by Usman on 23/11/2022.
//

import SwiftUI

struct PRCell: View {
    
    var pullRequest: PullRequest
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(pullRequest.creator)
                        .font(.caption)
                    Text(pullRequest.name)
                        .font(.title3)
                    statusString(status: pullRequest.status)
                        .font(.caption)
                }
                Spacer()
                PRIcon(state: pullRequest.status)
                    .padding([.trailing], -15)
            }
        }
        .frame(height: 50)
    }
    
    @ViewBuilder func statusString(status: PRStatus) -> some View {
        switch status {
        case .blocked:
            Text("BLOCKED")
        case .draft:
            Text("DRAFT")
        case .review:
            Text("IN REVIEW")
        case .attention:
            Text("APPROVED")
        }
    }
}

struct PRCell_Previews: PreviewProvider {
    static var previews: some View {
        PRCell(pullRequest: PullRequest(name: "Example PR",
                                        creator: "Example Creator",
                                        status: .review))
    }
}

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
//                    Text("labels")
                }
                Spacer()
                Image(systemName: "sun.dust")
            }
        }
        .frame(height: 50)
    }
}

struct PRCell_Previews: PreviewProvider {
    static var previews: some View {
        PRCell(pullRequest: PullRequest(name: "Example PR",
                                       creator: "Example Creator",
                                        status: .review))
    }
}

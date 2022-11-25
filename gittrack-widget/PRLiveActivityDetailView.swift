//
//  PRLiveActivityDetailView.swift
//  gittrack
//
//  Created by Usman on 24/11/2022.
//

import SwiftUI

struct PRLiveActivityDetailView: View {
    
    var model: PullRequest
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("GIT TRACK")
                    .font(.system(size: 8, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, 5)
                HStack {
                    Text(model.creator)
                        .font(.caption2)
                        .foregroundColor(.white)
                    Spacer()
                }
                Text(model.name)
                    .font(.title3)
                    .lineLimit(2)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.top, 5)
            Spacer()
            PRTimeline(status: model.status)
                .frame(width: 120, height: 50)
        }
        .padding()
    }
}

struct PRLiveActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PRLiveActivityDetailView(model: PullRequest(name: "Sample PR Name ds ds s", creator: "Sample Creator Name", status: .blocked))
            .background(Color.black)
            .previewLayout(.fixed(width: 300, height: 80))
    }
}

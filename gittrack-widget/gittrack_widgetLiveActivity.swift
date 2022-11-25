//
//  gittrack_widgetLiveActivity.swift
//  gittrack-widget
//
//  Created by Usman on 23/11/2022.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct gittrack_widgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PRTrackingAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                PRLiveActivityDetailView(model: PullRequest(name: context.attributes.name,
                                                            creator: context.attributes.author,
                                                            status: context.state.status)
                )
            }
            .activityBackgroundTint(Color.secondary)
            .activitySystemActionForegroundColor(Color.white)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: "g.circle")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    
                }
                DynamicIslandExpandedRegion(.bottom) {
                    PRLiveActivityDetailView(model: PullRequest(name: context.attributes.name,
                                                                creator: context.attributes.author,
                                                                status: context.state.status)
                    )
                }
            } compactLeading: {
                ZStack{}
            } compactTrailing: {
                ZStack {
                    GlowingCircle(glowing: true, status: context.state.status, maxRadius: 20)
                    Image(systemName: "g.circle").foregroundColor(.black)
                }.frame(width: 20, height: 20)
            } minimal: {
                Text("Min")
                    .border(.red)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

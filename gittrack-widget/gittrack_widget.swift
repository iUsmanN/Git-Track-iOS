//
//  gittrack_widget.swift
//  gittrack-widget
//
//  Created by Usman on 23/11/2022.
//

import WidgetKit
import SwiftUI
import Intents
import OctoKit

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> PREntry {
        PREntry(date: Date(), prObject: [PullRequest(name: "Name", creator: "Creator", status: .review)], configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (PREntry) -> ()) {
        let entry = PREntry(date: Date(), prObject: [PullRequest(name: "Name", creator: "Creator", status: .review)], configuration: ConfigurationIntent())
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<PREntry>) -> ()) {
        Octokit(TokenConfiguration("")).pullRequests(owner: "iUsmanN", repository: "CrowdCast_iOS") { response in
            switch response {
            case .success(let t):
                let prs = t.filter({$0.user?.login ?? "" == "iUsmanN"}).map { inputPR in
                    return PullRequest(name: inputPR.title ?? "XX", creator: inputPR.user?.login ?? "XX", status: .review)
                }
                let timeline = Timeline(entries: [PREntry(date: Date(), prObject: prs, configuration: ConfigurationIntent())], policy: .atEnd)
                completion(timeline)
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct PREntry: TimelineEntry {
    let date: Date
    let prObject: [PullRequest]
    let configuration: ConfigurationIntent
}

struct gittrack_widgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        
        VStack(spacing: -10) {
            Text("AUTHORED PRS").padding(.top, 10).padding(.bottom, 6).font(.caption)
            ForEach(entry.prObject.prefix(widgetFamily == .systemLarge ? 5 : 2), id: \.self) { pr in
                PRCell(pullRequest: pr).padding().padding(.top, -5)
            }
            Spacer()
        }
    }
}

////@main
//struct gittrackWidgetBuilder: WidgetBundle {
//    
//    @WidgetBundleBuilder
//    var body: some Widget {
//        gittrack_widget()
//        gittrack_widget2()
//    }
//}

struct gittrack_widget: Widget {
    let kind: String = "gittrack_widget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            gittrack_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("Authored PRs")
        .description("This shows your current Authored Pull Requests.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct gittrack_widget_Previews: PreviewProvider {
    static var previews: some View {
        
        gittrack_widgetEntryView(entry: PREntry(date: Date(), prObject: [PullRequest(name: "Name", creator: "Creator", status: .review), PullRequest(name: "Name", creator: "Creator", status: .attention)], configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        gittrack_widgetEntryView(entry: PREntry(date: Date(), prObject: [PullRequest(name: "Name", creator: "Creator", status: .review), PullRequest(name: "Name", creator: "Creator", status: .attention)], configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
        gittrack_widgetEntryView(entry: PREntry(date: Date(), prObject: [PullRequest(name: "Name", creator: "Creator", status: .review), PullRequest(name: "Name", creator: "Creator", status: .attention), PullRequest(name: "Name", creator: "Creator", status: .review), PullRequest(name: "Name", creator: "Creator", status: .attention), PullRequest(name: "Name", creator: "Creator", status: .review), PullRequest(name: "Name", creator: "Creator", status: .attention)], configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}

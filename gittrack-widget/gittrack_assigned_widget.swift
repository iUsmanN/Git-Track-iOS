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

struct AssignedPRProvider: IntentTimelineProvider {
    func placeholder(in context: Context) -> PREntry {
        //        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
        PREntry(date: Date(), prObject: [PullRequest(name: "Name", creator: "Creator", status: .review)], configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (PREntry) -> ()) {
        let entry = PREntry(date: Date(), prObject: [PullRequest(name: "Name", creator: "Creator", status: .review)], configuration: ConfigurationIntent())
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Octokit(TokenConfiguration("")).pullRequests(owner: "iUsmanN", repository: "CrowdCast_iOS") { response in
            switch response {
            case .success(let t):
                let prs = t.filter({$0.assignee?.login ?? "" == "iUsmanN"}).map { inputPR in
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

struct gittrack_assignedWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
            VStack(spacing: -10) {
                Text("ASSIGNED PRS").padding(.top, 10).padding(.bottom, 6).font(.caption)
                ForEach(entry.prObject.prefix(widgetFamily == .systemLarge ? 5 : 2), id: \.self) { pr in
                    PRCell(pullRequest: pr).padding().padding(.top, -5)
                }
                Spacer()
            }
        }
    }
}

struct gittrack_assignedWidget: Widget {
    let kind: String = "gittrack_widget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            gittrack_assignedWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Assigned PRs")
        .description("This shows your current Assigned Pull Requests.")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct gittrack_assigned_widget_Previews: PreviewProvider {
    static var previews: some View {
        
        gittrack_assignedWidgetEntryView(entry: PREntry(date: Date(), prObject: [PullRequest(name: "Name", creator: "Creator", status: .review), PullRequest(name: "Name", creator: "Creator", status: .attention)], configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
        
        gittrack_assignedWidgetEntryView(entry: PREntry(date: Date(), prObject: [PullRequest(name: "Name", creator: "Creator", status: .review), PullRequest(name: "Name", creator: "Creator", status: .attention)], configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
        
        gittrack_assignedWidgetEntryView(entry: PREntry(date: Date(), prObject: [PullRequest(name: "Name", creator: "Creator", status: .review), PullRequest(name: "Name", creator: "Creator", status: .attention), PullRequest(name: "Name", creator: "Creator", status: .review), PullRequest(name: "Name", creator: "Creator", status: .attention), PullRequest(name: "Name", creator: "Creator", status: .review), PullRequest(name: "Name", creator: "Creator", status: .attention)], configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}

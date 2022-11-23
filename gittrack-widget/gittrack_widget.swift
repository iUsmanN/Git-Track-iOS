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
//        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
        PREntry(date: Date(), prObject: PullRequest(name: "Name", creator: "Creator", status: .review), configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (PREntry) -> ()) {
        let entry = PREntry(date: Date(), prObject: PullRequest(name: "Name", creator: "Creator", status: .review), configuration: ConfigurationIntent())
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [PREntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = PREntry(date: entryDate, prObject: PullRequest(name: "Name", creator: "Creator", status: .review), configuration: ConfigurationIntent())
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

struct PREntry: TimelineEntry {
    let date: Date
    let prObject: PullRequest
    let configuration: ConfigurationIntent
}

struct gittrack_widgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.prObject.name)
        }
    }
}

struct gittrack_widget: Widget {
    let kind: String = "gittrack_widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            gittrack_widgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct gittrack_widget_Previews: PreviewProvider {
    static var previews: some View {
        gittrack_widgetEntryView(entry: PREntry(date: Date(), prObject: PullRequest(name: "Name", creator: "Creator", status: .review), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

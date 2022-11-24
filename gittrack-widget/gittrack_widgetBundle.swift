//
//  gittrack_widgetBundle.swift
//  gittrack-widget
//
//  Created by Usman on 23/11/2022.
//

import WidgetKit
import SwiftUI

@main
struct gittrack_widgetBundle: WidgetBundle {
    var body: some Widget {
        gittrack_widget()
        gittrack_assignedWidget()
        gittrack_widgetLiveActivity()
    }
}

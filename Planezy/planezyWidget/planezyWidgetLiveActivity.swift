//
//  planezyWidgetLiveActivity.swift
//  planezyWidget
//
//  Created by student on 10/05/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct planezyWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct planezyWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: planezyWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension planezyWidgetAttributes {
    fileprivate static var preview: planezyWidgetAttributes {
        planezyWidgetAttributes(name: "World")
    }
}

extension planezyWidgetAttributes.ContentState {
    fileprivate static var smiley: planezyWidgetAttributes.ContentState {
        planezyWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: planezyWidgetAttributes.ContentState {
         planezyWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: planezyWidgetAttributes.preview) {
   planezyWidgetLiveActivity()
} contentStates: {
    planezyWidgetAttributes.ContentState.smiley
    planezyWidgetAttributes.ContentState.starEyes
}

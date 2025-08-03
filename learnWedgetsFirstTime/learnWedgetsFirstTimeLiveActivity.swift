//
//  learnWedgetsFirstTimeLiveActivity.swift
//  learnWedgetsFirstTime
//
//  Created by Vishal Panchal on 02/08/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct learnWedgetsFirstTimeAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct learnWedgetsFirstTimeLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: learnWedgetsFirstTimeAttributes.self) { context in
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

extension learnWedgetsFirstTimeAttributes {
    fileprivate static var preview: learnWedgetsFirstTimeAttributes {
        learnWedgetsFirstTimeAttributes(name: "World")
    }
}

extension learnWedgetsFirstTimeAttributes.ContentState {
    fileprivate static var smiley: learnWedgetsFirstTimeAttributes.ContentState {
        learnWedgetsFirstTimeAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: learnWedgetsFirstTimeAttributes.ContentState {
         learnWedgetsFirstTimeAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: learnWedgetsFirstTimeAttributes.preview) {
   learnWedgetsFirstTimeLiveActivity()
} contentStates: {
    learnWedgetsFirstTimeAttributes.ContentState.smiley
    learnWedgetsFirstTimeAttributes.ContentState.starEyes
}

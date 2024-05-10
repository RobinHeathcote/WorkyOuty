//
//  SessionPagingView.swift
//  Workyouty Watch App
//
//  Created by Robin Heathcote on 10/05/2024.
//

import SwiftUI

struct SessionPagingView: View {
    @State private var selection: Tab = .metrics

    enum Tab {
        case controls, metrics, nowPlaying
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Controls").tag(Tab.controls)
            Text("Metrics").tag(Tab.metrics)
            Text("Now Playing").tag(Tab.nowPlaying)
        }
    }
}

#Preview {
    SessionPagingView()
}

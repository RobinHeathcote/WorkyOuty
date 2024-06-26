//
//  WorkyoutyApp.swift
//  Workyouty Watch App
//
//  Created by Robin Heathcote on 10/05/2024.
//

import SwiftUI

@main
struct Workyouty_Watch_AppApp: App {
    @StateObject var workoutManager = WorkoutManager()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                StartView()
            }
            .sheet(isPresented: $workoutManager.showingSummaryView) {
                SummaryView()
            }
            .environmentObject(workoutManager)
        }
    }
}

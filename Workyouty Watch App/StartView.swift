//
//  ContentView.swift
//  Workyouty Watch App
//
//  Created by Robin Heathcote on 10/05/2024.
//

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var workoutTypes: [HKWorkoutActivityType] = [.cycling, .running, .walking]
    var body: some View {
        List(workoutTypes) { workoutType in
            NavigationLink(
                workoutType.name,
                destination: SessionPagingView()
            ).padding(
                EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5)
            ).simultaneousGesture(TapGesture().onEnded {
                workoutManager.selectedWorkout = workoutType
            })
        }
        .listStyle(.carousel)
        .navigationBarTitle("Workouts")
        .onAppear {
            workoutManager.requestAuthorization()
        }
    }
}
    
#Preview {
    StartView()
}


extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }
    
    var name: String {
        switch self {
        case .running:
            return "Run"
        case .cycling:
            return "Bike"
        case .walking:
            return "Walk"
        default:
            return ""
        }
    }
}


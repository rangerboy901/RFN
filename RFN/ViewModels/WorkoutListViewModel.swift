//
//  WorkoutListViewModel.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import Foundation
import CoreData

class WorkoutListViewModel: ObservableObject {
    
    @Published var workouts = [WorkoutViewModel]()
    
    func deleteWorkout(workout: WorkoutViewModel) {
        let workout: Workout? = Workout.byId(id: workout.workoutId)
        if let workout = workout {
            try? workout.delete()
        }
    }
    
    func getAllWorkouts() {
        DispatchQueue.main.async {
            self.workouts = Workout.all().map(WorkoutViewModel.init)
        }
    }
}

struct WorkoutViewModel {
    
    let workout: Workout
    
    var workoutId: NSManagedObjectID {
        return workout.objectID
    }
    
    var title: String {
        return workout.title ?? ""
    }
    
    var objective: String {
        return workout.objective ?? "Not available"
    }
    var type: String {
        return workout.type ?? "HIIT"
    }
    
    var dueDate: String? {
        return workout.dueDate?.asFormattedString()
    }
    
}


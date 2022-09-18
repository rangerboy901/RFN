//
//  AddExerciseViewModel.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import Foundation
import CoreData

class AddExerciseViewModel: ObservableObject {
    
    dynamic var exercise: String = ""
    dynamic var name: String = ""
    
    func addExerciseToWorkout(workoutId: NSManagedObjectID) {
        
        dynamic var workout: Workout? = Workout.byId(id: workoutId)
        
        if let workout = workout {
            let exercise = Exercise(context: Exercise.viewContext)
            exercise.name = name
   //      exercise.addToWorkouts(workout)
         
            try? exercise.save()
        }
        
    }
    
}


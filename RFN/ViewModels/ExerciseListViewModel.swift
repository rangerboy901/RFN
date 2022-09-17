//
//  ExerciseListViewModel.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import Foundation
import CoreData

class ExerciseListViewModel: ObservableObject {
    
    @Published var exercises = [ExerciseViewModel]()
    
    func getExercisesByWorkout(vm: WorkoutViewModel) {
        DispatchQueue.main.async {
            self.exercises = Exercise.getExercisesByWorkoutId(workoutId: vm.workoutId).map(ExerciseViewModel.init)
        }
    }
    
}

struct ExerciseViewModel {
    
    let exercise: Exercise
    
    
    var exerciseId: NSManagedObjectID {
        return exercise.objectID
    }
    
    var name: String {
        return exercise.name ?? ""
    }
    
    var movies: [WorkoutViewModel] {
        return Workout.byExerciseName(name: name).map(WorkoutViewModel.init)
    }
}


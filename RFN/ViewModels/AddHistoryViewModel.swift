//
//  AddHistoryViewModel.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import Foundation

class AddReviewViewModel: ObservableObject {
    
    var name: String = ""
    var details: String = ""
    
    func addReviewForWorkout(vm: WorkoutViewModel) {
        
        let workout: Workout? = Workout.byId(id: vm.workoutId)
        
        let history = History(context: Workout.viewContext)
        history.name = name
        history.details = details
        history.workout = workout
        
        // save the review
        try? history.save()
    }
    
}

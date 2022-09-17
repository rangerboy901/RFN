//
//  AddWorkoutViewModel.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import Foundation

class AddWorkoutViewModel: ObservableObject {
    
    var title: String = ""
    var objective: String = ""
    var type: String = ""
    var dueDate: Date = Date()
    
    func save() {
        
        let workout = Workout(context: Workout.viewContext)
        workout.title = title
        workout.objective = objective
        workout.type = type
        workout.dueDate = dueDate
        
        try? workout.save()
    }
    
}


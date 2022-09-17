//
//  Exercise+Extension.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import Foundation
import CoreData

extension Exercise: BaseModel {
    
    static func getExercisesByWorkoutId(workoutId: NSManagedObjectID) -> [Exercise] {
        guard let workout = Workout.byId(id: workoutId) as? Workout,
            let  _ = workout.exercises
        else {
            return []
        }
        
        return []
    }
    
}


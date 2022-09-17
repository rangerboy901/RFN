//
//  WorkoutExtensions.swift
//  RFN
//
//  Created by Joseph Wil;liam DeWeese on 9/17/22.
//


import Foundation
import CoreData

extension Workout: BaseModel {
    
    static func byExerciseName(name: String) -> [Workout] {
        
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        request.predicate = NSPredicate(format: "exercises.name CONTAINS %@", name)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
        
    }
    
}

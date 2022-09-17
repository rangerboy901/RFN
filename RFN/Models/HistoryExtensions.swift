//
//  HistoryExtensions.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import Foundation
import CoreData

extension History: BaseModel {
    
    static func getReviewsByWorkoutId(workoutId: NSManagedObjectID) -> [History] {
        
        let request: NSFetchRequest<History> = History.fetchRequest()
        request.predicate = NSPredicate(format: "workout = %@", workoutId)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
}


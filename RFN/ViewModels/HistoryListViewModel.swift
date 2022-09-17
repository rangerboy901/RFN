//
//  HistoryListViewModel.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import Foundation
import CoreData

class HistoryListViewModel: ObservableObject {
    
   @Published var reviews = [HistoryViewModel]()
    
    func getReviewsByWorkout(vm: WorkoutViewModel) {
        DispatchQueue.main.async {
            self.reviews = History.getReviewsByWorkoutId(workoutId: vm.workoutId).map(HistoryViewModel.init)
        }
    }
}

struct HistoryViewModel {
    
    let history: History
    
    var historyId: NSManagedObjectID {
        return history.objectID
    }
    
    var name: String {
        return history.name ?? ""
    }
    
    var text: String {
        return history.details ?? ""
    }
    
    var publishedDate: Date? {
        return history.publishedAt
    }
    
}


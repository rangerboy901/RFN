//
//  RFNApp.swift
//  RFN
//
//  Created by Joseph Wil;liam DeWeese on 9/17/22.
//

import SwiftUI

@main

struct RFNApp: App {
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some Scene {
        WindowGroup {
            WorkoutListScreen()
        }
    }
}

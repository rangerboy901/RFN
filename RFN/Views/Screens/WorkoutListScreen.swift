//
//  WorkoutListScreen.swift
//  RFN
//
//  Created by Joseph Wil;liam DeWeese on 9/17/22.
//

import SwiftUI

struct WorkoutListScreen: View {
    ///Properties:
    @StateObject private var workoutListVM = WorkoutListViewModel()
    
    @State private var isPresented: Bool = false
    ///Delete Workout
    private func deleteWorkout(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let workout = workoutListVM.workouts[index]
            // delete the workout
            workoutListVM.deleteWorkout(workout: workout)
            // get all workouts
            workoutListVM.getAllWorkouts()
        }
    }
    func colorize(type: String) -> Color {
        switch type {
        case "HIIT":
            return .blue
        case "Recover":
            return .indigo
        case "Strength":
            return .orange
        case "Cardio":
            return .pink
        case "Power":
            return .green
        default:
            return .gray
            
        }
    }
        var body: some View {
            
            List{
                
                ForEach(workoutListVM.workouts, id: \.workoutId) { workout in
                    NavigationLink(
                        destination: WorkoutDetailScreen(),
                        label: {
                            WorkoutCellView(workout: workout)
                        })
                }.onDelete(perform: deleteWorkout)
                
            }///#endOfList
            .listStyle(PlainListStyle())
            
            .navigationTitle("Workouts")
            .navigationBarItems(
                trailing: Button(action: {
                    isPresented = true
                }) {
                    Image(systemName: "plus")
                })
        .foregroundColor(.primary)
        .sheet(isPresented: $isPresented, onDismiss: {
            workoutListVM.getAllWorkouts()
            
        },  content: {
            AddWorkoutScreen()
        })
        .embedInNavigationView()
            
            .onAppear(perform: {
                UITableView.appearance().separatorStyle = .none
                UITableView.appearance().separatorColor = .clear
                workoutListVM.getAllWorkouts()
            })
        }
    }
  

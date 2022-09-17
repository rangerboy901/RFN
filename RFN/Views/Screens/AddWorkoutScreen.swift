//
//  AddWorkoutScreen.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import SwiftUI

struct AddWorkoutScreen: View {
    ///:Properties:
    @StateObject private var addWorkoutVM = AddWorkoutViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    let types = ["Strength", "Power", "Cardio", "HIIT", "Recover"]
    
    
    var body: some View {
        Form{
            Section(header: Text("Add Workout")) {
                TextField("Enter name of workout...", text:$addWorkoutVM.title)
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .cornerRadius(10)
                    .font(.system(size: 20, weight: .bold, design: .default))
            
                Section("WorkoutObjective 📝"){
                    TextEditor(text: $addWorkoutVM.objective)
                        .frame(height: 75)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(10)
                        .font(.system(size: 20, weight: .bold, design: .default))
                    
                }
                Text("Workout Type:")
                Picker("Workout Type:", selection: $addWorkoutVM.type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
               
                
                DatePicker("Date Created:", selection: $addWorkoutVM.dueDate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .background(Color(UIColor.tertiarySystemFill))
                    .cornerRadius(10)
                    .font(.system(size: 17, weight: .semibold, design: .default))
                
                
            }
            .foregroundColor(.primary)
            HStack {
                Spacer()
                Button("Save"){
                    
                    addWorkoutVM.save()
                    presentationMode.wrappedValue.dismiss()
                }
                
                .font(.system(size: 20, weight: .bold, design: .default))
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(.blue)
                .cornerRadius(10)
                .foregroundColor(Color.white)
            }
            
        }//  #endOf FORM
        .formStyle(GroupedFormStyle())
        .navigationTitle("Add Workout")
        .embedInNavigationView()
    }
    
}
      


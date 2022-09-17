//
//  FormattedDate.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import Foundation

extension Date {
    
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
    
}


//
//  ViewExtension.swift
//  RFN
//
//  Created by Joseph William DeWeese on 9/17/22.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}


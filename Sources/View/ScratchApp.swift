//
//  ScratchApp.swift
//  Scratch
//
//  Created by Roman Podymov on 02/11/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

@main
struct ScratchApp: App {
    let store = Store(initialState: .initialState) {
        MainTabCoordinator()
    }

    var body: some Scene {
        WindowGroup {
            MainTabCoordinatorView(store: store)
        }
    }
}

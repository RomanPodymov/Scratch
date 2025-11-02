//
//  ScratchReducer.swift
//  Scratch
//
//  Created by Roman Podymov on 02/11/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture
import MapKit
import Photos
import PhotosUI
import SwiftUI

@Reducer
struct ScratchReducer {
    @ObservableState
    struct State: Equatable, Hashable {
        static let initialState = State()

        var code = UUID()
    }

    enum Action {
        case scratch
    }

    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case .scratch:
                .none
            }
        }
    }
}

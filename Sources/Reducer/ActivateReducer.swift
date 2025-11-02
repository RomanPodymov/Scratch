//
//  ActivateReducer.swift
//  Scratch
//
//  Created by Roman Podymov on 02/11/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct ActivateReducer {
    @ObservableState
    struct State: Equatable, Hashable {
        static let initialState = State()

        var code = UUID()
    }

    enum Action {
        case activate
    }

    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case .activate:
                .run { _ in
                    @Dependency(\.scratchClient) var scratchClient
                    try await scratchClient.activate()
                }
            }
        }
    }
}

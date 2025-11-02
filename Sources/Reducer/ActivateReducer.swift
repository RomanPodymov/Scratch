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
        case activateSuccess
        case activateError
    }

    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case .activate:
                .run { @MainActor send in
                    do {
                        @Dependency(\.scratchClient) var scratchClient
                        _ = try await scratchClient.activate("1234")
                        send(.activateSuccess)
                    } catch {
                        send(.activateError)
                    }
                }
            case .activateSuccess:
                .none
            case .activateError:
                .none
            }
        }
    }
}

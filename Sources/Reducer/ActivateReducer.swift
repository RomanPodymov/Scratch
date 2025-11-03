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
        case activate(String)
        case activateSuccess
        case activateError
    }

    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {
            case let .activate(code):
                .run { send in
                    do {
                        @Dependency(\.scratchClient) var scratchClient
                        _ = try await scratchClient.activate(code)
                        await send(.activateSuccess)
                    } catch {
                        await send(.activateError)
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

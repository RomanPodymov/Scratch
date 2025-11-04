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
        Reduce { state, action in
            switch action {
            case .activate:
                .run { [code = state.code] send in
                    do {
                        @Dependency(\.scratchClient) var scratchClient
                        _ = try await scratchClient.activate(code.uuidString)
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

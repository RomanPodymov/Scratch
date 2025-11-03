//
//  FullActivateReducer.swift
//  Scratch
//
//  Created by Roman Podymov on 03/11/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture

@Reducer
struct FullActivateReducer {
    @ObservableState
    struct State: Equatable, Hashable {
        static let initialState = State()

        var basic = BasicReducer.State.initialState
        var custom = ActivateReducer.State.initialState
    }

    enum Action {
        case basic(BasicReducer.Action)
        case custom(ActivateReducer.Action)
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.basic, action: \.basic) {
            BasicReducer()
        }
        Scope(state: \.custom, action: \.custom) {
            ActivateReducer()
        }
        Reduce { _, action in
            switch action {
            case .custom(.activate):
                .run { send in
                    await send(.basic(.startLoading))
                }
            case .custom(.activateSuccess):
                .run { send in
                    await send(.basic(.endLoading))
                }
            case .custom(.activateError):
                .run { send in
                    await send(.basic(.endLoading))
                    await send(.basic(.error(true)))
                }
            default:
                .none
            }
        }
    }
}

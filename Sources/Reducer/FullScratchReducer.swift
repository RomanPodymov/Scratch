//
//  FullScratchReducer.swift
//  Scratch
//
//  Created by Roman Podymov on 03/11/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture

@Reducer
struct FullScratchReducer {
    @ObservableState
    struct State: Equatable, Hashable {
        static let initialState = State()

        var basic = BasicReducer.State.initialState
        var custom = ScratchReducer.State.initialState
    }

    enum Action {
        case basic(BasicReducer.Action)
        case custom(ScratchReducer.Action)
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.basic, action: \.basic) {
            BasicReducer()
        }
        Scope(state: \.custom, action: \.custom) {
            ScratchReducer()
        }
        Reduce { _, action in
            switch action {
            case .custom(.scratch):
                .run { send in
                    await send(.basic(.startLoading))
                }
            default:
                .none
            }
        }
    }
}

//
//  MainTabCoordinator.swift
//  Scratch
//
//  Created by Roman Podymov on 12/06/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture

@Reducer
struct MainTabCoordinator {
    enum Tab: Hashable {
        case scratch, activate
    }

    enum Action {
        case scratch(FullScratchReducer.Action)
        case activate(FullActivateReducer.Action)
        case tabSelected(Tab)
    }

    @ObservableState
    struct State: Equatable {
        static let initialState = State(
            scratch: .initialState,
            activate: .initialState,
            selectedTab: .scratch
        )

        var scratch: FullScratchReducer.State
        var activate: FullActivateReducer.State

        var selectedTab: Tab
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.scratch, action: \.scratch) {
            FullScratchReducer()
        }
        Scope(state: \.activate, action: \.activate) {
            FullActivateReducer()
        }
        Reduce { state, action in
            switch action {
            case let .tabSelected(tab):
                state.selectedTab = tab
                return .cancel(id: CancelID.scratch)
            case let .scratch(.custom(.scratchSuccess(code))):
                state.activate.custom.code = code
                return .none
            default:
                return .none
            }
        }
    }
}

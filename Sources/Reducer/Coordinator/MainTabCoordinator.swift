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
        case scratch(ScratchReducer.Action)
        case activate(ActivateReducer.Action)
        case tabSelected(Tab)
    }

    @ObservableState
    struct State: Equatable {
        static let initialState = State(
            scratch: .initialState,
            activate: .initialState,
            selectedTab: .scratch
        )

        var scratch: ScratchReducer.State
        var activate: ActivateReducer.State

        var selectedTab: Tab
    }

    var body: some ReducerOf<Self> {
        /* Scope(state: \.map, action: \.map) {
             MapCoordinator()
         }
         Scope(state: \.list, action: \.list) {
             LocationsListCoordinator()
         }
         Scope(state: \.user, action: \.user) {
             UserCoordinator()
         } */
        Reduce { state, action in
            switch action {
            case let .tabSelected(tab):
                state.selectedTab = tab
            default:
                break
            }
            return .none
        }
    }
}

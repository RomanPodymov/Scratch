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
        case scratchSuccess(UUID)
        case scratchFailed
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .scratch:
                return .run { send in
                    @Dependency(\.scratchClient) var scratchClient
                    let code = try await scratchClient.scratch()
                    await send(.scratchSuccess(code))
                }
            case let .scratchSuccess(code):
                state.code = code
                return .none
            case .scratchFailed:
                return .none
            }
        }
    }
}

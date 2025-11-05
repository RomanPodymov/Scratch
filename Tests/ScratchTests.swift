//
//  ScratchTests.swift
//  Scratch
//
//  Created by Roman Podymov on 29/06/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture
@testable import ScratchApp
import Testing

@Suite
struct ScratchTests {
    @Test
    @MainActor
    func scratchAlwaysFailingForDummy() async throws {
        // Given
        let store = Store(initialState: .initialState) {
            ScratchReducer()
        }
        let initialCode = store.code
        // When
        store.send(.scratch)
        // Then
        #expect(store.state.code == initialCode)
    }
}

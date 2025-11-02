//
//  ScratchClient.swift
//  Scratch
//
//  Created by Roman Podymov on 02/11/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture

@DependencyClient
struct ScratchClient {
    typealias ActivateProvider = @Sendable () async throws -> Void

    let activate: ActivateProvider
}

extension DependencyValues {
    var scratchClient: ScratchClient {
        get { self[ScratchClient.self] }
        set { self[ScratchClient.self] = newValue }
    }
}

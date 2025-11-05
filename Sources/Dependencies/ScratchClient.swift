//
//  ScratchClient.swift
//  Scratch
//
//  Created by Roman Podymov on 02/11/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture
import Foundation

@DependencyClient
struct ScratchClient {
    typealias ScratchProvider = @Sendable () async throws(ScratchClientError) -> UUID
    typealias ActivateProvider = @Sendable (String) async throws(ScratchClientError) -> VersionResponse

    let scratch: ScratchProvider
    let activate: ActivateProvider
}

extension DependencyValues {
    var scratchClient: ScratchClient {
        get { self[ScratchClient.self] }
        set { self[ScratchClient.self] = newValue }
    }
}

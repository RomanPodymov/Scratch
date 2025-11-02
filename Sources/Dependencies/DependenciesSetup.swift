//
//  DependenciesSetup.swift
//  Scratch
//
//  Created by Roman Podymov on 26/06/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import Combine
import ComposableArchitecture

extension ScratchClient: DependencyKey {
    private static let dummy = ScratchClient(activate: {})

    static let liveValue = dummy
}

extension ScratchClient: TestDependencyKey {
    static let previewValue = dummy

    static let testValue = previewValue
}

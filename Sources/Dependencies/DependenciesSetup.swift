//
//  DependenciesSetup.swift
//  Scratch
//
//  Created by Roman Podymov on 26/06/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import Combine
import ComposableArchitecture
import Foundation

extension ScratchClient: DependencyKey {
    private static let dummy = ScratchClient(activate: {})

    private static let o2online = {
        let client = ScratchClient(activate: {
            guard var components = URLComponents(string: "https://api.o2.sk/version") else {
                return
            }
            components.queryItems = [.init(name: "code", value: "1234")]
            guard let url = components.url else {
                return
            }
            let request = URLRequest(url: url)
            let data = try await URLSession.shared.data(for: request)
        })
        return client
    }()

    static let liveValue = o2online
}

extension ScratchClient: TestDependencyKey {
    static let previewValue = dummy

    static let testValue = previewValue
}

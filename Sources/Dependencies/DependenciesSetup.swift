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

struct VersionResponse: Codable {
    let ios: String
    let iosTM: String
    let iosRA: String
    let iosRA2: String
    let android: String
    let androidTM: String
    let androidRA: String

    enum CodingKeys: String, CodingKey {
        case ios
        case iosTM
        case iosRA
        case iosRA2 = "iosRA_2"
        case android
        case androidTM
        case androidRA
    }
}

enum ScratchClientError: Error {
    case noData
}

extension ScratchClient: DependencyKey {
    private static let dummy = ScratchClient(activate: { _ in throw ScratchClientError.noData })

    private static let o2online = {
        let client = ScratchClient(activate: { code in
            guard var components = URLComponents(string: "https://api.o2.sk/version") else {
                throw ScratchClientError.noData
            }
            components.queryItems = [.init(name: "code", value: code)]
            guard let url = components.url else {
                throw ScratchClientError.noData
            }
            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(VersionResponse.self, from: data)
            return response
        })
        return client
    }()

    static let liveValue = o2online
}

extension ScratchClient: TestDependencyKey {
    static let previewValue = dummy

    static let testValue = previewValue
}

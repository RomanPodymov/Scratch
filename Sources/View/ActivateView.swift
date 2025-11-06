//
//  ActivateView.swift
//  Scratch
//
//  Created by Roman Podymov on 02/11/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct ActivateView: View {
    var store: StoreOf<FullActivateReducer>

    var body: some View {
        VStack {
            if store.custom.isActivated {
                Text("label.activated.title")
            } else {
                Text("label.not_activated.title")
            }
            Button("button.activate.title") {
                store.send(.custom(.activate))
            }
        }
        .loadingIndicator(store.basic.isLoading)
    }
}

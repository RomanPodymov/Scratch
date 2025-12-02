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
    @Bindable var store: StoreOf<FullActivateReducer>

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
        .alert(
            "alert.generic_error.title",
            isPresented: $store.basic.showingAlert.sending(\.basic.error),
            actions: {
                Button("alert.generic_error.button", role: .cancel) {}
            },
            message: {
                Text("alert.generic_error.message_activate")
            }
        )
    }
}

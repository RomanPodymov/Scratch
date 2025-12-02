//
//  ScratchView.swift
//  Scratch
//
//  Created by Roman Podymov on 02/11/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

struct ScratchView: View {
    @Bindable var store: StoreOf<FullScratchReducer>

    var body: some View {
        VStack {
            Button("button.scratch.title") {
                store.send(.custom(.scratch))
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
                Text("alert.generic_error.message_scratch")
            }
        )
    }
}

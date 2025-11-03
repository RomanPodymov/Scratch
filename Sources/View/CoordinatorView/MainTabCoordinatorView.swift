//
//  MainTabCoordinatorView.swift
//  Scratch
//
//  Created by Roman Podymov on 12/06/2025.
//  Copyright © 2025 Scratch. All rights reserved.
//

import ComposableArchitecture
import SwiftUI
import TCACoordinators

struct MainTabCoordinatorView: View {
    @Bindable var store: StoreOf<MainTabCoordinator>

    var body: some View {
        TabView(selection: $store.selectedTab.sending(\.tabSelected)) {
            /* ScratchView(store: store.scope(state: \.scratch, action: \.scratch))
                 .tabItem { Text("tab.scratch.title") }
                 .tag(MainTabCoordinator.Tab.scratch)

             ActivateView(store: store.scope(state: \.activate, action: \.activate))
                 .tabItem { Text("tab.activate.title") }
                 .tag(MainTabCoordinator.Tab.activate) */
        }
    }
}

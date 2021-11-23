//
//  ProxyReleaseApp.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import SwiftUI

final class AppViewModel: ObservableObject {
    @Published var devMenu = false
}

@main
struct ProxyReleaseApp: App {
    @ObservedObject var viewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            RootView(viewModel: RootViewModel())
                .simultaneousGesture(
                    TapGesture(count: 2)
                        .onEnded({ _ in
                            // check certificate and build configuration
                            viewModel.devMenu = true
                        })
                )
                .sheet(
                    isPresented: $viewModel.devMenu,
                    content: {
                        Text("DevMenu")
                    }
                )
        }
    }
}

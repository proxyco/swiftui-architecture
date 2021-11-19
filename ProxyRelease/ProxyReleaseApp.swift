//
//  ProxyReleaseApp.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import SwiftUI

@main
struct ProxyReleaseApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(viewModel: RootViewModel())
        }
    }
}

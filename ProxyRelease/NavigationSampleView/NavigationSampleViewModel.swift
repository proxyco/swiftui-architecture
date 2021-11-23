//
//  NavigationSampleViewModel.swift
//  ProxyRelease
//
//  Created by Andres Canal on 23/11/2021.
//

import Foundation
import SwiftUINavigation

enum Route {
    case openViewA
    case openViewB
}

final class NavigationSampleViewModel: ObservableObject {

    @Published var route: Route?

    func openViewA() {
        route = .openViewA
    }

    func openViewB() {
        route = .openViewB
    }
}

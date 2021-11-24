//
//  NavigationSampleViewModel.swift
//  ProxyRelease
//
//  Created by Andres Canal on 23/11/2021.
//

import Foundation
import SwiftUINavigation
import SwiftUI

enum Route {
    case editUser(_ user: User?)
}

final class NavigationSampleViewModel: ObservableObject {

    @Published var route: Route?
    @Published var user: User = User(firstName: "", lastName: "")

    func editUser() {
        route = .editUser(user)
    }
}

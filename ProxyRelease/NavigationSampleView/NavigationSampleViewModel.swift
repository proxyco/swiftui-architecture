//
//  NavigationSampleViewModel.swift
//  ProxyRelease
//
//  Created by Andres Canal on 23/11/2021.
//

import Foundation
import SwiftUINavigation
import SwiftUI
import Combine

enum Route {
    case editUser(_ user: User?)
    case counter(counter: Int)
    case sample(counter: Int)
}

final class NavigationSampleViewModel: ObservableObject {

    @Published var route: Route?
    @Published var user: User = User(firstName: "", lastName: "")

    private var cancellables = Set<AnyCancellable>()

    init() {
        setupBindings()
    }

    func editUser() {
        route = .editUser(user)
    }

    func setupBindings() {
        $user.sink { user in
            // This doesn't get called because we are modifying the wrapped value
            print("User changed")
        }.store(in: &cancellables)
    }
}

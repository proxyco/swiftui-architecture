//
//  NavigationBuilder.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 22/11/21.
//

import Foundation
import SwiftUI

final class NavigationBuilder {
    @ViewBuilder
    func viewForRoute(_ route: NavigationRoute) -> some View {
        switch route {
            case let .repository(repository):
                RepositoryView(viewModel: RepositoryViewModel(repository: repository))
        }
    }
}

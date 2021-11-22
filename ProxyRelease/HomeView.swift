//
//  HomeView.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    var repositories: [Repository] = Repository.allCases
}

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        List(viewModel.repositories) { repo in
            NavigationLink(destination: RepositoryView(viewModel: RepositoryViewModel(repository: repo))) {
                RepositoryItemView(repository: repo)
            }
            .listRowInsets(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        }
        .listStyle(.plain)
    }
}

struct RepositoryItemView: View {
    let repository: Repository

    var body: some View {
        SingleLineView(title: repository.name)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}

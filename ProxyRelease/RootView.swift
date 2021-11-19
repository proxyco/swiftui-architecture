//
//  ContentView.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import SwiftUI

final class RootViewModel: ObservableObject {
    enum Tab: String, Identifiable {
        var id: String { rawValue }
        case home, tasks

        var navTitle: String {
            switch self {
                case .home: return "Repositories"
                case .tasks: return "Tasks"
            }
        }
    }

    @Published var selectedTab: RootViewModel.Tab = .home
}

struct RootView: View {
    @ObservedObject var viewModel: RootViewModel

    var body: some View {
        NavigationView {
            TabView(selection: $viewModel.selectedTab) {
                HomeView(viewModel: HomeViewModel())
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text(RootViewModel.Tab.home.navTitle)
                    }
                    .tag(RootViewModel.Tab.home)
                    .navigationBarTitle(viewModel.selectedTab.navTitle)

                PendingTasksView()
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle")
                        Text(RootViewModel.Tab.tasks.navTitle)
                    }
                    .tag(RootViewModel.Tab.tasks)
                    .navigationBarTitle(viewModel.selectedTab.navTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewModel: RootViewModel())
    }
}

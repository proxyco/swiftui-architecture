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
        case home, tasks, navigation

        var navTitle: String {
            switch self {
                case .home: return "Repositories"
                case .tasks: return "Tasks"
                case .navigation: return "Navigation"
            }
        }
    }

    @Published var selectedTab: RootViewModel.Tab = .home
    @Published var showModal: Bool = false
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

                PendingTasksView()
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle")
                        Text(RootViewModel.Tab.tasks.navTitle)
                    }
                    .tag(RootViewModel.Tab.tasks)

                NavigationSampleView(viewModel: NavigationSampleViewModel())
                    .tabItem {
                        Image(systemName: "flame")
                        Text(RootViewModel.Tab.tasks.navTitle)
                    }
                    .tag(RootViewModel.Tab.navigation)
            }.navigationBarTitle(viewModel.selectedTab.navTitle)

        }.onOpenURL { url in
            print("Handled in RootView level: \(url)")
            viewModel.showModal = true
        }.sheet(isPresented: $viewModel.showModal) {
            Text("Hi there")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewModel: RootViewModel())
    }
}

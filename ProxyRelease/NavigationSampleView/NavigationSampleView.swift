//
//  NavigationSampleView.swift
//  ProxyRelease
//
//  Created by Andres Canal on 23/11/2021.
//

import SwiftUI
import SwiftUINavigation

struct NavigationSampleView: View {
    @ObservedObject var viewModel: NavigationSampleViewModel

    var body: some View {

        VStack(spacing: 10) {
            Button {
                viewModel.openViewA()
            } label: {
                Text("Push")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(.blue)
                    .foregroundColor(.white)
            }

            Button {
                viewModel.openViewB()
            } label: {
                Text("Second")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(.red)
                    .foregroundColor(.white)
            }
            Button {
                print("Alert")
            } label: {
                Text("Third")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(.green)
                    .foregroundColor(.white)
            }

            NavigationLink(
                unwrapping: $viewModel.route,
                case: /Route.openViewA,
                destination: { _ in ViewA() },
                onNavigate: { _ in },
                label: { EmptyView() }
            ).sheet(unwrapping: $viewModel.route, case: /Route.openViewB) { _ in
                ViewB()
            }
        }
    }
}

struct NavigationSampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationSampleView(viewModel: NavigationSampleViewModel())
    }
}

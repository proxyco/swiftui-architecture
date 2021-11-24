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

        VStack(alignment: .leading, spacing: 10) {
            Group {
                Text("First: \(viewModel.user.firstName)")
                Text("Last: \(viewModel.user.lastName)")
            }.padding([.top, .leading, .trailing], 20)

            Spacer()
            
            NavigationLink(
                unwrapping: $viewModel.route,
                case: /Route.editUser,
                destination: { $user in
                    EditorView(viewModel: EditorViewModel(user: $user.wrappedValue))
                },
                onNavigate: {
                    guard $0 else { return }
                    self.viewModel.editUser()
                },
                label: {
                    Text("Edit User with no Binding")
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                }
            )

            NavigationLink(
                unwrapping: $viewModel.route,
                case: /Route.editUser,
                destination: { $user in
                    EditorView(viewModel: EditorViewModel(user: $user))
                },
                onNavigate: {
                    guard $0 else { return }
                    self.viewModel.editUser()
                },
                label: {
                    Text("Edit User with Binding")
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                        .background(.green)
                        .foregroundColor(.white)
                }
            )
        }
    }
}

struct NavigationSampleView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationSampleView(viewModel: NavigationSampleViewModel())
    }
}

//
//  NavigationSampleView.swift
//  ProxyRelease
//
//  Created by Andres Canal on 23/11/2021.
//

import SwiftUI
import SwiftUINavigation

struct CounterView: View {

    @Binding var counter: Int

    var body: some View {

        VStack {
            Text("\(counter)")
            Button {
                counter += 1
            } label: {
                Text("Increase")
            }
        }
    }
}

struct NavigationSampleView: View {
//    @ObservedObject var viewModel: NavigationSampleViewModel

    @State private var counter: Int = 0
    @State var route: Route?

    var body: some View {
        print(Self._printChanges())

        return VStack(alignment: .leading, spacing: 10) {
//            Group {
//                Text("First: \(viewModel.user.firstName)")
//                Text("Last: \(viewModel.user.lastName)")
                Text("Counter: \(counter)")
//            }.padding([.top, .leading, .trailing], 20)

//            Spacer()
            
//            NavigationLink(
//                unwrapping: $viewModel.route,
//                case: /Route.editUser,
//                destination: { $user in
//                    EditorView(viewModel: EditorViewModel(user: $user.wrappedValue))
//                },
//                onNavigate: {
//                    guard $0 else { return }
//                    self.viewModel.editUser()
//                },
//                label: {
//                    Text("Edit User with no Binding")
//                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
//                        .background(.blue)
//                        .foregroundColor(.white)
//                }
//            )

            NavigationLink(
                unwrapping: $route,
                case: /Route.sample,
                destination: { $counter in
                    CounterView(counter: $counter)
                        .navigationBarItems(trailing: Button("Save", action: {
                            print(counter)
                            self.counter = counter
                        }))
                },
                onNavigate: {
                    guard $0 else { return }
                    self.route = .sample(counter: counter)
                },
                label: {
                    Text("Counter: ||\(self.counter)||")
                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                        .background(.green)
                        .foregroundColor(.white)
                }
            )

//            NavigationLink(
//                unwrapping: $viewModel.route,
//                case: /Route.editUser,
//                destination: { $user in
//                    EditorView(viewModel: EditorViewModel(user: $user))
//                },
//                onNavigate: {
//                    guard $0 else { return }
//                    self.viewModel.editUser()
//                },
//                label: {
//                    Text("Edit User with Binding")
//                        .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 50)
//                        .background(.green)
//                        .foregroundColor(.white)
//                }
//            )
        }
    }
}
//
//struct NavigationSampleView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        NavigationSampleView(viewModel: NavigationSampleViewModel())
//    }
//}

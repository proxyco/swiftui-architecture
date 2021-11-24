//
//  EditorView.swift
//  ProxyRelease
//
//  Created by Andres Canal on 24/11/2021.
//

import Foundation
import SwiftUI

final class EditorViewModel: ObservableObject {

    @Published var firstName: String
    @Published var lastName: String

    @Published var user: User

    init(user: User) {
        _user = Published(initialValue: user)

        firstName = user.firstName
        lastName = user.lastName
    }

    func save() {
        user.firstName = firstName
        user.lastName = lastName
    }
}

struct EditorView: View {

    @ObservedObject var viewModel: EditorViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {

        VStack {
            Form {
                Section(header: Text("User Details")) {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                }
            }

            Spacer()

            Button {
                viewModel.save()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Save")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(.green)
                    .foregroundColor(.white)
            }.padding([.bottom], 10)
        }
        .navigationTitle("Edit User")
    }
}

struct EditorView_Previews: PreviewProvider {
    static var previews: some View {
        EditorView(
            viewModel: EditorViewModel(user: User(firstName: "", lastName: ""))
        )
    }
}




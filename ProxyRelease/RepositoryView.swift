//
//  RepositoryView.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import Foundation
import SwiftUI

final class RepositoryViewModel: ObservableObject {
    let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }

    func triggerBuild(_ build: Build) {
        // TODO: trigger build
    }
}

struct RepositoryView: View {
    @ObservedObject var viewModel: RepositoryViewModel

    var body: some View {
        VStack {
            Text(viewModel.repository.name)
            Spacer()
            HStack {
                Button(Build.testflight.rawValue.capitalized) {
                    viewModel.triggerBuild(Build.testflight)
                }
                .buttonStyle(BorderedButtonStyle())

                Button(Build.appStore.rawValue.capitalized) {
                    viewModel.triggerBuild(Build.appStore)
                }
                .buttonStyle(BorderedButtonStyle())
            }
        }
    }
}

struct RepositoryView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryView(viewModel: RepositoryViewModel(repository: .appPdm))
    }
}

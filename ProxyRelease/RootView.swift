//
//  ContentView.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import SwiftUI

final class RootViewModel: ObservableObject {

}

struct RootView: View {
    @ObservedObject var viewModel: RootViewModel

    var body: some View {
        NavigationView {

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewModel: RootViewModel())
    }
}

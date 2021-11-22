//
//  NotificationsView.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import Foundation
import SwiftUI

struct PendingTasksView: View {
    var body: some View {
        List {
            Section("Exploration") {
                SingleLineView(title: "Navigation")
                SingleLineView(title: "Dependency Injection")
                SingleLineView(title: "Mix SwiftUI & UIKit")
                SingleLineView(title: "UIKit embebed")
            }
            
            Section("App tasks") {
                SingleLineView(title: "Trigger builds")
                SingleLineView(title: "App Icon")
            }
        }
        .listStyle(.plain)
    }
}

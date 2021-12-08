//
//  FallbackViewControllerWrapper.swift
//  ProxyRelease
//
//  Created by Raluca Toadere on 19.11.2021.
//

import Foundation
import SwiftUI

struct FallbackViewControllerWrapper: UIViewControllerRepresentable {
    @Binding var model: FallbackView.UIModel
    @Binding var buttonTapCount: Int

    func makeUIViewController(context: Context) -> FallbackViewController {
        let viewController = FallbackViewController()
        viewController.delegate = context.coordinator
        return viewController
    }

    // communication from SwiftUI to UIKit
    func updateUIViewController(_ uiViewController: FallbackViewController, context: Context) {
        uiViewController.fallbackView?.setup(with: $model.wrappedValue)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // communication from UIKit to SwiftUI
    class Coordinator: FallbackViewControllerDelegate {
        let parent: FallbackViewControllerWrapper

        init(_ parent: FallbackViewControllerWrapper) {
            self.parent = parent
        }

        func didTapButton() {
            parent.buttonTapCount += 1
        }
    }
}

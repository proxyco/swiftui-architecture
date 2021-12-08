//
//  FallbackViewController.swift
//  ProxyRelease
//
//  Created by Raluca Toadere on 19.11.2021.
//

import Foundation
import UIKit

protocol FallbackViewControllerDelegate {
    func didTapButton()
}

class FallbackViewController: UIViewController {
    var fallbackView: FallbackView?
    var delegate: FallbackViewControllerDelegate?

    override func loadView() {
        fallbackView = FallbackView()
        self.view = fallbackView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fallbackView?.button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
    }

    @objc func didTapButton(_ sender: UIButton) {
        delegate?.didTapButton()
    }
}

class FallbackView: UIView {

    struct UIModel {
        let title: String
        let actionTitle: String
    }

    let label = UILabel()
    let button = UIButton(configuration: .filled(), primaryAction: nil)

    init() {
        super.init(frame: .zero)

        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
    }

    func setup(with model: UIModel) {
        label.text = model.title
        button.setTitle(model.actionTitle, for: .normal)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

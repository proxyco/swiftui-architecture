//
//  DependencyInjector.swift
//  ProxyRelease
//
//  Created by Andres Canal on 22/11/2021.
//

import Foundation

var DI: DependencyInjectorProtocol = DependencyInjector.shared

typealias DependencyInjectorProtocol = SampleServiceProvider & UserServiceProvider

protocol SampleServiceProvider {
    var sampleService: SampleServiceProtocol { get }
}

protocol UserServiceProvider {
    var userService: UserServiceProtocol { get }
}

final class DependencyInjector: DependencyInjectorProtocol {

    static let shared: DependencyInjectorProtocol = DependencyInjector()
    private var userContainer = DependencyContainer()

    var sampleService: SampleServiceProtocol {
        userContainer.instance(for: SampleServiceProtocol.self) { SampleService() }
    }

    var userService: UserServiceProtocol {
        userContainer.instance(for: UserServiceProtocol.self) { UserService() }
    }
}

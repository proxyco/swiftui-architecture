//
//  DependencyInjector.swift
//  ProxyRelease
//
//  Created by Andres Canal on 22/11/2021.
//

import Foundation

protocol DependencyInjectorProtocol {
    var sampleService: SampleServiceProtocol { get }
}

var DI: DependencyInjectorProtocol = DependencyInjector.shared

final class DependencyInjector: DependencyInjectorProtocol {

    static let shared: DependencyInjectorProtocol = DependencyInjector()
    private var userContainer = DependencyContainer()

    var sampleService: SampleServiceProtocol {
        userContainer.instance(for: SampleServiceProtocol.self) { SampleService() }
    }
}

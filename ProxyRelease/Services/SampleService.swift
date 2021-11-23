//
//  SampleService.swift
//  ProxyRelease
//
//  Created by Andres Canal on 22/11/2021.
//

import Foundation

protocol SampleServiceProtocol {
    func doSomething(action: @escaping () -> Void)
}

final class SampleService: SampleServiceProtocol {

    func doSomething(action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            action()
        }
    }
}

final class SampleServiceMock: SampleServiceProtocol {

    func doSomething(action: @escaping () -> Void) {

    }
}

//
//  DependencyInjectorMock.swift
//  ProxyRelease
//
//  Created by Andres Canal on 23/11/2021.
//

import Foundation

final class DependencyInjectorMock: DependencyInjectorProtocol {

    var sampleServiceMock: SampleServiceMock {
        sampleService as! SampleServiceMock
    }

    var sampleService: SampleServiceProtocol = {
        SampleServiceMock()
    }()

    var userServiceMock: UserServiceMock {
        userService as! UserServiceMock
    }

    var userService: UserServiceProtocol = {
        UserServiceMock()
    }()
}


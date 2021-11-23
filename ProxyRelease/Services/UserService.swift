//
//  UserService.swift
//  ProxyRelease
//
//  Created by Andres Canal on 23/11/2021.
//

import Foundation

protocol UserServiceProtocol {
    var name: String { get }
}

final class UserService: UserServiceProtocol {

    var name: String { "User name" }

}

final class UserServiceMock: UserServiceProtocol {

    var name: String = ""

}

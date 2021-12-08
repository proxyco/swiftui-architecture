//
//  HomeViewModelSpec.swift
//  ProxyReleaseTests
//
//  Created by Andres Canal on 23/11/2021.
//

import Foundation
import Nimble
import Quick
@testable import ProxyRelease

final class HomeViewModelSpec: QuickSpec {
    override func spec() {
        describe("HomeViewModel") {
            let mockDI = DependencyInjectorMock()
            var homeViewModel: HomeViewModel!

            beforeEach {
                mockDI.userServiceMock.name = "Sarasa"
                homeViewModel = HomeViewModel(dependencies: mockDI)
            }

            it("has correct name") {
                expect(homeViewModel.userName) == "Sarasa"
            }
        }
    }
}

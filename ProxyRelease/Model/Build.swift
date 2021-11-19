//
//  Build.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import Foundation

enum Build: String, Identifiable, CaseIterable {
    case testflight, appStore

    var id: String { rawValue }
}

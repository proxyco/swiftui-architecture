//
//  Repository.swift
//  ProxyRelease
//
//  Created by Facundo Menzella on 19/11/21.
//

import Foundation

enum Repository: String, Identifiable, CaseIterable {
    case appId, appCheckin, appPdm

    var id: String { rawValue }

    var name: String {
        switch self {
            case .appId: return "Proxy ID"
            case .appCheckin: return "Proxy Checkin"
            case .appPdm: return "Proxy Device Manager"
        }
    }
}

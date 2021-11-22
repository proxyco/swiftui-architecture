//
//  DependencyContainer.swift
//  ProxyRelease
//
//  Created by Andres Canal on 22/11/2021.
//

import Foundation

final class DependencyContainer {
    private struct InstanceKey: Hashable {
        internal let instanceType: Any.Type

        public func hash(into hasher: inout Hasher) {
            ObjectIdentifier(instanceType).hash(into: &hasher)
        }

        static func == (lhs: InstanceKey, rhs: InstanceKey) -> Bool {
            lhs.instanceType == rhs.instanceType
        }
    }

    private var instances: [InstanceKey: AnyObject] = [:]

    func instance<T, S: AnyObject>(for instanceType: T.Type, constructor: () -> S) -> S {
        let instanceKey = InstanceKey(instanceType: instanceType)
        guard let instance = instances[instanceKey] as? S else {
            let newInstance = constructor()
            instances[instanceKey] = newInstance
            return newInstance
        }

        return instance
    }

    func removeInstance<T: Any>(for instanceType: T.Type) {
        let instanceKey = InstanceKey(instanceType: instanceType)
        instances[instanceKey] = nil
    }

    func reset() {
        instances.removeAll()
    }
}

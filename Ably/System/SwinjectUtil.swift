//
//  SwinjectUtil.swift
//  Ably
//
//  Created by gyuree kim on 2022/09/08.
//

import SwiftUI
import Swinject

typealias DIContainer = Container

// MARK: - Swinject + Util
extension DIContainer {
    /// container[ServiceType.self] 로 사용하세요
    subscript<T>(
        serviceType: T.Type,
        name: String? = nil
    ) -> T? {
        resolve(serviceType, name: name)
    }
}

// MARK: - preview
extension DIContainer {
    /// View Preview용 DIContainer 기본값
    static let preview: DIContainer = {
        .init()
    }()
}

// MARK: - View Environment
struct DIContainerKey: EnvironmentKey {
    static let defaultValue: DIContainer = .preview
}

extension EnvironmentValues {
    var container: DIContainer {
        get { self[DIContainerKey.self] }
        set { self[DIContainerKey.self] = newValue }
    }
}

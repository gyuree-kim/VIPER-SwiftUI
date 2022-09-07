//
//  DIEnvironment.swift
//  Ably
//
//  Created by gyuree kim on 2022/09/08.
//

import Foundation
import UIKit
import SwiftUI

final class DIEnvironment {
    private var scheme: Scheme
    let navigation: UINavigationController
    
    init(scheme: Scheme, navigation: UINavigationController) {
        self.scheme = scheme
        self.navigation = navigation
    }
    
    func create() -> DIContainer {
        setDependencies()
    }
    
    private func setDependencies() -> DIContainer {
        let container = DIContainer()
        
        setRouters(container)
        
        return container
    }
    
    private func setRouters(_ container: DIContainer) {
        // 최상위 hosting view controller
        container.register(
            UIViewController.self,
            name: "rootHostingViewController",
            factory: { r in
                let appRoot = AppRoot()
                    .environment(\.container, container)
                
                return UIHostingController(rootView: appRoot)
            }
        )
        .inObjectScope(.weak)
        
        // 최상위 navigation
        container.register(
            UINavigationController.self,
            name: "rootNavigation",
            factory: { r in
                let hosting = r.resolve(
                    UIViewController.self,
                    name: "rootHostingViewController"
                )!
                
                return self.navigation
            }
        )
        .inObjectScope(.weak)
        
        container.register(
            MainTabRouter.self,
            factory: { _ in RealMainTabRouter(container) }
        )
    }
}

extension DIEnvironment {
    enum Scheme {
        case real
        case mock
    }
}

protocol MainTabRouter {
    func start()
}

class RealMainTabRouter: MainTabRouter {
    init(_ container: DIContainer) {
        
    }
    
    func start() {
        
    }
}

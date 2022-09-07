//
//  AppBooter.swift
//  Ably
//
//  Created by gyuree kim on 2022/09/08.
//

import UIKit
import SwiftUI

class AppBooter {
    var navigation: UINavigationController
    var window: UIWindow
    var container: DIContainer? = nil
    
    // TODO: - 나중에 따로 빼기
    var isDev: Bool {
        false
    }
    
    init(
        navigation: UINavigationController,
        window: UIWindow
    ) {
        self.navigation = navigation
        self.window = window
    }
    
    func start() {
        if isDev { goEnvironmentSelect() }
        else { setupEnvironment(scheme: .real) }
    }
}

extension AppBooter {
    func setupEnvironment(scheme: DIEnvironment.Scheme) {
        self.container = DIEnvironment(scheme: scheme, navigation: navigation)
            .create()
        
        bootEnded()
    }
    
    func goEnvironmentSelect() {
        let rootView = EnvironmentSelect(delegate: self)
        let hosting = UIHostingController(rootView: rootView)
        
        navigation.setViewControllers([hosting], animated: false)
    }
    
    func bootEnded() {
        guard let container = container else { return }
        
        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: { [weak self] in
                self?.window.rootViewController = self?.navigation
            })
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            container[MainTabRouter.self]!.start()
        }
    }
}

extension AppBooter: EnvironmentSelectDelegate {
    func onSelected(scheme: DIEnvironment.Scheme) {
        setupEnvironment(scheme: scheme)
    }
}


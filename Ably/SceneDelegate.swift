//
//  SceneDelegate.swift
//  Ably
//
//  Created by gyuree kim on 2022/09/08.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        setupWindow(scene, willConnectTo: session, options: connectionOptions)
    }
}

extension SceneDelegate {
    private func setupAppearance(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // navigation bar default (기본 투명색)
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        // tab bar default
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor.white
        tabBarAppearance.shadowColor = .clear
        UITabBar.appearance().standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        UITabBar.appearance().barTintColor = .white
    }
    
    private func setupWindow(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            window!.rootViewController = boot(window: window!)
            window!.makeKeyAndVisible()
        }
    }
}

// MARK: - app boot
extension SceneDelegate {
    func boot(window: UIWindow) -> UIViewController {
        let navigation = UINavigationController()
        navigation.isNavigationBarHidden = true
        AppBooter(navigation: navigation, window: window).start()
        
        return navigation
    }
}

// MARK: - LifeCycle
extension SceneDelegate {
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}

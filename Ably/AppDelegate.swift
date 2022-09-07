//
//  AppDelegate.swift
//  Ably
//
//  Created by gyuree kim on 2022/09/08.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }
}

// MARK: - SceneDelegate
extension AppDelegate {
    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
      ) -> UISceneConfiguration {
        let sceneConfig = UISceneConfiguration(
            name: nil,
            sessionRole: connectingSceneSession.role
        )
        sceneConfig.delegateClass = SceneDelegate.self
        return sceneConfig
      }
    
    private func sceneDelegate(_ application: UIApplication) -> SceneDelegate? {
        return application.windows
            .compactMap({ $0.windowScene?.delegate as? SceneDelegate })
            .first
    }
}

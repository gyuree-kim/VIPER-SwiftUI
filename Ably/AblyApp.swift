//
//  AblyApp.swift
//  Ably
//
//  Created by gyuree kim on 2022/09/08.
//

import SwiftUI

@main
struct AblyApp: App {
    @UIApplicationDelegateAdaptor
    private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            Text("splash")
                .onOpenURL { print("deeplink url: \($0)") }
        }
    }
}

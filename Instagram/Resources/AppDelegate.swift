//
//  AppDelegate.swift
//  Instagram
//
//  Created by Alfly on 2020/11/12.
//  Copyright © 2020 Alfly. All rights reserved.
//

import UIKit
import LeanCloud

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 在 Application 初始化代码执行之前执行
        LCApplication.logLevel = .off
        
        do {
            try LCApplication.default.set(
                id: "stgl1o19ta4XDoqpBHDhU8sV-gzGzoHsz",
                key: "lgHXxAVqPGPQg4Nxrz1sGs5U",
                serverURL: "https://stgl1o19.lc-cn-n1-shared.com")
        } catch {
            print(error)
        }
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


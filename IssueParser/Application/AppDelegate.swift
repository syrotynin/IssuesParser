//
//  AppDelegate.swift
//  IssueParser
//
//  Created by Serhii Syrotynin on 07.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startApplication()
        return true
    }
    
    private func startApplication() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = ApplicationCoordinator(window: window)
        
        self.window = window
        window.makeKeyAndVisible()
        appCoordinator.start()
    }
}


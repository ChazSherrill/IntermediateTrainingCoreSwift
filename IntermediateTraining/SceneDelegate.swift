//
//  SceneDelegate.swift
//  IntermediateTraining
//
//  Created by Brian Voong on 4/30/20.
//  Copyright © 2020 Lets Build That App. All rights reserved.
//

import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            let companiesController = ViewController()
            let navController = CustomNavigationController(rootViewController: companiesController)
            window.rootViewController = navController
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
}
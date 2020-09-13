//
//  SceneDelegate.swift
//  BucketList
//
//  Created by Alex Sapsford on 06/09/2020.
//  Copyright © 2020 Alex Sapsford. All rights reserved.
//

import UIKit
import SwiftUI
import Combine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private let authenticationController = AuthenticationController()
    private var authenticationStateCancellable: AnyCancellable?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            window.makeKeyAndVisible()
            
            beginObservingAuthenticationState()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

// MARK: - Authentication Logic
extension SceneDelegate {
    
    private func updateRootViewControllerForAuthenticationState(on window: UIWindow?, isAuthenticated: Bool) {
        guard let window = window else {
            return
        }
        
        if isAuthenticated {
            window.rootViewController = UIHostingController(rootView: RootTabView())
        } else {
            window.rootViewController = UIHostingController(rootView: OnboardingView(authenticationController: authenticationController))
        }
    }
    
    private func beginObservingAuthenticationState() {
        authenticationStateCancellable = authenticationController.$isAuthenticated.sink(receiveValue: { (isAuthenticated) in
            self.updateRootViewControllerForAuthenticationState(on: self.window, isAuthenticated: isAuthenticated)
        })
    }
}

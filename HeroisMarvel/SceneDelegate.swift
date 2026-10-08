//
//  SceneDelegate.swift
//  HeroisMarvel
//
//  Created by Wesley Marins on 08/10/26.
//  Copyright © 2026 Eric Brito. All rights reserved.
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let _ = (scene as? UIWindowScene) else {
            return
        }
    }
}

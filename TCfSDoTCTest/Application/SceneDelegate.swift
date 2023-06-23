//
//  SceneDelegate.swift
//  TCfSDoTCTest
//
//  Created by Евгений Лукин on 20.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.windowScene = windowScene
        let mainVC = OnboardingViewController()
        window?.rootViewController = UINavigationController(rootViewController: mainVC)
        window?.makeKeyAndVisible()
    }
}

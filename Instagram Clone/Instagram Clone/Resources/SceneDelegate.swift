//
//  SceneDelegate.swift
//  Instagram Clone
//
//  Created by Aamir khan on 25/04/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        window?.rootViewController = getMyTabbarController()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    func getMyTabbarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let firstVC = navigationController
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .blue
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .systemMint
        let fourthVC = UIViewController()
        fourthVC.view.backgroundColor = .cyan
        let fifthVC = UIViewController()
        fifthVC.view.backgroundColor = .yellow
        
        let item1 = UITabBarItem(title: "", image: UIImage(systemName: "house"), tag: 0)
        let item2 = UITabBarItem(title: "", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        let item3 = UITabBarItem(title: "", image: UIImage(systemName: "plus.square"), tag: 0)
        let item4 = UITabBarItem(title: "", image: UIImage(systemName: "heart"), tag: 0)
        let item5 = UITabBarItem(title: "", image: UIImage(systemName: "person"), tag: 0)
        
        firstVC.tabBarItem = item1
        secondVC.tabBarItem = item2
        thirdVC.tabBarItem = item3
        fourthVC.tabBarItem = item4
        fifthVC.tabBarItem = item5
        
        tabBarController.viewControllers = [firstVC,secondVC,thirdVC,fourthVC,fifthVC]
        tabBarController.tabBar.tintColor = .black
        tabBarController.modalPresentationStyle = .fullScreen
        
        return tabBarController
    }

}


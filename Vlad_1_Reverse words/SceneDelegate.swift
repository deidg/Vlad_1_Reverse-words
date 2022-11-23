//
//  SceneDelegate.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        let controller = ViewController()
        let navController = UINavigationController(rootViewController: controller)
        window?.rootViewController = navController
        
        navController.navigationBar.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 0.94)
//        navController.navigationBar.backgroundColor = .green
        navController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        
        
        
//        navController.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
//                                                      .foregroundColor: UIColor.white]
        
        
        
        
        //        navController.navigationBar.frame = CGRect(x: 0, y: 0, width: 375, height: 88);
        
        
//        navController.navigationBar.barTintColor = UIColor(red: 249, green: 249, blue: 249, alpha: 0.94)
        
        
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = UIColor(red: 249, green: 249, blue: 249, alpha: 0.94)
        
        
//        if #available(iOS 15, *) {
//            let navigationBarAppearance = UINavigationBarAppearance()
//            navigationBarAppearance.configureWithOpaqueBackground()
//            navigationBarAppearance.titleTextAttributes = [
//                NSAttributedString.Key.foregroundColor : UIColor.red
//            ]
            
            //                navigationBarAppearance.shadowColor = nil
            //                navigationBarAppearance.backgroundColor = UIColor(red: 135/255, green: 134/255, blue: 100/255, alpha: 0.94)
            ////            UINavigationBar.appearance().barStyle = UIColor(red: 249, green: 249, blue: 249, alpha: 0.94)
            //                UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            //                UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            //                UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            // Defining our screen title
            //            title = "UINavigationBar on " + UIDevice.current.systemVersion
            
//            let appearance = UINavigationBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = .red
//            appearance.titleTextAttributes = [.font: UIFont.boldSystemFont(ofSize: 20.0),
//                                              .foregroundColor: UIColor.white]
            
            
            
            
            
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
    


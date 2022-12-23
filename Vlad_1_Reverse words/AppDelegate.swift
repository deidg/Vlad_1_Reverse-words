//
//  AppDelegate.swift
//  Vlad_1_Reverse words
//
//  Created by Alex on 17.11.2022.
//

//начать с configurationUpdateHandler
//UIButton.Configuration

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

//     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
//                         [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//
//            UIFont.familyNames.forEach({ name in
//                for font_name in UIFont.fontNames(forFamilyName: name) {
//                    print("\n\(font_name)")
//                }
//            })
//            return true
//
//        }
        
    
    
    var window: UIWindow?
    
    var navController = UINavigationController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
       let viewController = ViewController()
        self.navController = UINavigationController(rootViewController: viewController)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = self.navController
        
//        self.window?.backgroundColor =  UIColor(red: 249, green: 249, blue: 249, alpha: 0.94)
        self.window?.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        //        self.window?.backgroundColor = UIColor(red: 249, green: 249, blue: 249, alpha: 0.94)


//        navController.navigationBar.backgroundColor = UIColor(red: 249, green: 249, blue: 249, alpha: 0.94)
        self.window?.makeKeyAndVisible()

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


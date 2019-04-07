//
//  AppDelegate.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/16/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let sb:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let isLogin:Bool = UserDefaults.standard.bool(forKey: "logedIn")
        let isDonePersonal = UserDefaults.standard.bool(forKey: "donePersonal")
        if isLogin {
            if isDonePersonal {
                let thanksVc = sb.instantiateViewController(withIdentifier: "thanksVc")
                self.window?.rootViewController = thanksVc
            }
            else{
                let homeVc = sb.instantiateViewController(withIdentifier: "loginVc")
                self.window?.rootViewController = homeVc
            }
            
        }
        else{
            let loginVc = sb.instantiateViewController(withIdentifier: "companyVc")
            self.window?.rootViewController = loginVc
        }
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


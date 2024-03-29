//
//  AppDelegate.swift
//  PhaseTwo
//
//  Created by Shaun Tucker on 1/19/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var vcsArray = [UIViewController]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let foodVC = storyboard.instantiateViewController(withIdentifier: "foodTypeVC") as! FoodTypeVC
        let restVC = storyboard.instantiateViewController(withIdentifier: "restaurantVC") as! CuisineRestVC
        let homeVC = storyboard.instantiateViewController(withIdentifier: "homeVC") as! HomeVC
        
        vcsArray = [foodVC, restVC, homeVC]
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    enum ShortcutType : String {
        case conceirge = "conceirge"
        case restaurant = "restaurant"
        case airport = "airport"
        case casino = "casino"
    }
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        print(shortcutItem.type)
        
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            let navVC = window?.rootViewController as! UINavigationController
            navVC.setViewControllers(vcsArray, animated: false)
            
            switch type {
            case ShortcutType.airport.rawValue:
                navVC.popToViewController(vcsArray[1], animated: true)
                completionHandler(true)
                
            case ShortcutType.casino.rawValue:
                navVC.popToViewController(vcsArray[2], animated: true)
                completionHandler(true)
                
            case ShortcutType.conceirge.rawValue:
                navVC.popToViewController(vcsArray[1], animated: true)
                completionHandler(true)
                
            case ShortcutType.restaurant.rawValue:
                navVC.popToViewController(vcsArray[2], animated: true)
                completionHandler(true)
                
                
            default:
                navVC.popToViewController(vcsArray[2], animated: true)
                completionHandler(true)
//                navVC.popToRootViewController(animated: true)
//                completionHandler(true)
            }
        }
        
        completionHandler(false)
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
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "PhaseTwo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}


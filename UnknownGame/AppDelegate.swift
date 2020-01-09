//
//  AppDelegate.swift
//  UnknownGame
//
//  Created by Ilya Sokolov on 05/09/2019.
//  Copyright © 2019 Ilya Sokolov. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        self.readData()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        self.saveData()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        self.readData()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        self.readData()
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveData()
        self.saveContext()
    }
    
    func saveData() {
//        let userDefaults = UserDefaults.standard
//
//        let encodedStreamTVArrData : Data = NSKeyedArchiver.archivedData(withRootObject: streamTVArr)
//        userDefaults.set(encodedStreamTVArrData, forKey: "StreamTVArray")
    }
    
    func readData() {
        let userDefaults = UserDefaults.standard
        
        hh = userDefaults.integer(forKey: "time_HH")
        mm = userDefaults.integer(forKey: "time_MM")
        ddIndex = userDefaults.integer(forKey: "time_DD_Index")
        playerStatus = userDefaults.integer(forKey: "player_Status")
        dollars = userDefaults.integer(forKey: "dollars")
        
        workName = userDefaults.string(forKey: "workName")
        hasWork = userDefaults.bool(forKey: "hasWork")
        isAtNight = userDefaults.bool(forKey: "isAtNight")
        workMasteryLevel = userDefaults.integer(forKey: "workMasteryLevel")
        playerMastery = userDefaults.double(forKey: "playerMastery")
        salary = userDefaults.integer(forKey: "salary")
        workStartTime = userDefaults.integer(forKey: "workStartTime")
        workEndTime = userDefaults.integer(forKey: "workEndTime")
        workPoints = userDefaults.double(forKey: "workPoints")
        
        isFirstAnimate = userDefaults.bool(forKey: "isFirstAnimate")
        hasFreelance = userDefaults.bool(forKey: "hasFreelance")
        freelanceSalary = userDefaults.integer(forKey: "freelanceSalary")
        isHourly = userDefaults.bool(forKey: "isHourly")
        jobDeadline = userDefaults.integer(forKey: "jobDeadline")
        jobProgress = userDefaults.integer(forKey: "jobProgress")
        
        streamTVLF = userDefaults.integer(forKey: "StreamTVLastFollower")
        videoPlatformLF = userDefaults.integer(forKey: "VideoPlatformLastFollower")
        
        // StreamTV
        
        if let decodedStreamTVArr = userDefaults.data(forKey: "StreamTVArray") {
            streamTVSavedArr = NSKeyedUnarchiver.unarchiveObject(with: decodedStreamTVArr) as! [Media]
        }
        
        if let decodedStreamTV = userDefaults.data(forKey: "StreamTV") {
            streamTV = NSKeyedUnarchiver.unarchiveObject(with: decodedStreamTV) as! Media
        }
        
        if let decodedStreamTVTransferData = userDefaults.data(forKey: "StreamTVTransfer") {
            streamTVTransfer = NSKeyedUnarchiver.unarchiveObject(with: decodedStreamTVTransferData) as! Media
        }
        
        // Video Platform
        
        if let decodedVideoPlatfromArr = userDefaults.data(forKey: "VideoPlatformArray") {
            videoPlatformArr = NSKeyedUnarchiver.unarchiveObject(with: decodedVideoPlatfromArr) as! [Media]
        }
        
        if let decodedVideoPlatfrom = userDefaults.data(forKey: "VideoPlatform") {
            videoPlatform = NSKeyedUnarchiver.unarchiveObject(with: decodedVideoPlatfrom) as! Media
        }
        
        if let decodedVideoPlatfromTransfer = userDefaults.data(forKey: "VideoPlatformTransfer") {
            videoPlatformTransfer = NSKeyedUnarchiver.unarchiveObject(with: decodedVideoPlatfromTransfer) as! Media
        }
        
        // Freelance
        
        if let decodedFEL = userDefaults.data(forKey: "fixedPriceEntryLevelArr") {
            fixedPriceEntryLevel = NSKeyedUnarchiver.unarchiveObject(with: decodedFEL) as! [Job]
        }
        
        if let decodedFI = userDefaults.data(forKey: "fixedPriceIntermediateArr") {
            fixedPriceIntermediate = NSKeyedUnarchiver.unarchiveObject(with: decodedFI) as! [Job]
        }
        
        if let decodedFE = userDefaults.data(forKey: "fixedPriceExpertArr") {
            fixedPriceExpert = NSKeyedUnarchiver.unarchiveObject(with: decodedFE) as! [Job]
        }
        
        if let decodedHEL = userDefaults.data(forKey: "hourlyEntryLevelArr") {
            hourlyEntryLevel = NSKeyedUnarchiver.unarchiveObject(with: decodedHEL) as! [Job]
        }
        
        if let decodedHI = userDefaults.data(forKey: "hourlyIntermediateArr") {
            hourlyIntermediate = NSKeyedUnarchiver.unarchiveObject(with: decodedHI) as! [Job]
        }
        
        if let decodedHE = userDefaults.data(forKey: "hourlyExpertArr") {
            hourlyExpert = NSKeyedUnarchiver.unarchiveObject(with: decodedHE) as! [Job]
        }
        
        if let decodedTF = userDefaults.data(forKey: "takeJobFixedPriceArr") {
            takeJobFixedPrice = NSKeyedUnarchiver.unarchiveObject(with: decodedTF) as! [Job]
        }
        
        if let decodedTH = userDefaults.data(forKey: "takeJobHourlyArr") {
            takeJobHourly = NSKeyedUnarchiver.unarchiveObject(with: decodedTH) as! [Job]
        }
        
        // Profile
        
        if let decodedProfileData = userDefaults.data(forKey: "ProfileData") {
            player = NSKeyedUnarchiver.unarchiveObject(with: decodedProfileData) as! ProfileModel
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateWork"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateMediaProgressView"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateMediaLabels"), object: nil)
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "UnknownGame")
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


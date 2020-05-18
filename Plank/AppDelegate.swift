//
//  AppDelegate.swift
//  Plank
//
//  Created by Алексей Чигарских on 25.04.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        // to delete all days from CoreData:
       /*
        for i in trDays {
            CoreDataManager.sharedInstance.managedObjectContext.delete(i)
            CoreDataManager.sharedInstance.saveContext()
        }
        */
        
        
        //       создаем новую базу тренировочных дней в CoreData если она еще не создана
        if trDays.count < 1 {
            let _ = DayE.newDay(dayNumber: 0) //  чтобы не сбивались порядковые числа в массива создаем нулевой день
            let restDays: [Int] = [6, 13, 19, 26]  // Устанавливаем дни отдыха  в календаре
        for numDay in 1...30 {

           let nd =   DayE.newDay(dayNumber: Int16(clamping: numDay))
            if restDays.contains(numDay) {
                nd.condition = "rest"
            } else {nd.condition = "willcomplete"}
        }
        CoreDataManager.sharedInstance.saveContext()
        }
        if trDays.count > 31 { CoreDataManager.sharedInstance.deleteEcxeededDaysFromCD()}
        
        
        
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


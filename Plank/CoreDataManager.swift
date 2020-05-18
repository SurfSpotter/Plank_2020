//
//  CoreDataManager.swift
//  Plank
//
//  Created by Алексей Чигарских on 18.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import CoreData







// MARK: - Core Data stack
class CoreDataManager {
    static let sharedInstance = CoreDataManager()
    var managedObjectContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
   lazy var persistentContainer: NSPersistentCloudKitContainer = {
     
       let container = NSPersistentCloudKitContainer(name: "DataModel")
       container.loadPersistentStores(completionHandler: { (storeDescription, error) in
           if let error = error as NSError? {
             
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

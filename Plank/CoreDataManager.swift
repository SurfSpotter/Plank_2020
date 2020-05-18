//
//  CoreDataManager.swift
//  Plank
//
//  Created by Алексей Чигарских on 18.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import CoreData




 
 var trDays: [DayE] {
     let request = NSFetchRequest<DayE>(entityName: "DayE")
     let sd = NSSortDescriptor(key: "dayNum", ascending: true)
     request.sortDescriptors = [sd]
     let arrayOfSortedDays = try? CoreDataManager.sharedInstance.managedObjectContext.fetch(request)
     if arrayOfSortedDays != nil {
         return arrayOfSortedDays!
     }
     
     return []
 }
 
 
 




// MARK: - Core Data stack
class CoreDataManager {
    static let sharedInstance = CoreDataManager()
    var managedObjectContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
   lazy var persistentContainer: NSPersistentCloudKitContainer = {
     
       let container = NSPersistentCloudKitContainer(name: "DatModel")
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
    
    func deleteEcxeededDaysFromCD() {
        var tempI: Int16 = 9999
        for i in trDays {
            print("I want delet \(i)")
            if i.dayNum == tempI {
                CoreDataManager.sharedInstance.managedObjectContext.delete(i)
                
            }
            tempI =  i.dayNum
            CoreDataManager.sharedInstance.saveContext()
        }
    }
}

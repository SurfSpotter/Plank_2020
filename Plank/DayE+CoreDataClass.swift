//
//  DayE+CoreDataClass.swift
//  
//
//  Created by Алексей Чигарских on 18.05.2020.
//
//

import Foundation
import CoreData

@objc(DayE)
public class DayE: NSManagedObject {
    class func newDay(dayNumber: Int) -> DayE {
        let nDay = DayE(context: CoreDataManager.sharedInstance.managedObjectContext)
        nDay.dateUpdate = Date()
        return nDay
    }
}

//
//  DayE+CoreDataProperties.swift
//  
//
//  Created by Алексей Чигарских on 18.05.2020.
//
//

import Foundation
import CoreData


extension DayE {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayE> {
        return NSFetchRequest<DayE>(entityName: "DayE")
    }

    @NSManaged public var condition: String?
    @NSManaged public var feelings: Int16
    @NSManaged public var dateUpdate: Date?
    @NSManaged public var dayNum: Int16

}

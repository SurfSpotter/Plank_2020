//
//  Model.swift
//  Plank
//
//  Created by Алексей Чигарских on 13.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation

enum condEnum: String {
    case passed = "passed"
    case complete = "complete"
    case willcomplete = "willcomplete"
    case rest = "rest"
    
    
}


class Day {
       var number: Int = 0
       var completed: Bool = false
       var condition: condEnum = .rest
       var feelings: Int = 0
       var dateUpdate: Date = Date()
   init(){
       
   }
       init (numberDay: Int) {
           number = numberDay
       }
       
       
       
   }

class Model {
    
    var Alldays: [Day] = []
    
    

    
    
    // Создаем массив с включенными параметрами из UserDefaults
    func createTrainingDays() -> [Day] {
        Alldays.append(Day(numberDay: 0))
        for countOfDay in 1...30  {
            
            let DayCreated = Day(numberDay: countOfDay)
            DayCreated.completed = UserDefaults.standard.bool(forKey: "completedUDfor\(countOfDay)")
            DayCreated.condition = { () -> condEnum in
                let condition =  UserDefaults.standard.string(forKey: "conditionUdFor\(countOfDay)")
                if condition != nil {
                    switch condition {
                    case "passed" : return condEnum.passed
                    case "complete" : return condEnum.complete
                    case "willcomplete" : return condEnum.willcomplete
                    case "rest" : return condEnum.rest
                    default : return condEnum.willcomplete
                    }
                }
                return condEnum.willcomplete
            }()
            DayCreated.feelings = UserDefaults.standard.integer(forKey: "feelingsUDfor\(countOfDay)")
            
            
            DayCreated.dateUpdate = { () -> Date in
                let currentDate = UserDefaults.standard.object(forKey: "dateUpdateFor\(countOfDay)")
                if currentDate != nil {
                    return UserDefaults.standard.object(forKey: "dateUpdateFor\(countOfDay)") as! Date
                    

                }
                return Date()
            }()
            Alldays.append(DayCreated)
        }
        print ("Array of \(Alldays.count) days is created")
        return Alldays
        
    }
    
    
    // Функции отвечающие за добавление разлиных параметров к дню
    
    func addCompletedToUd(inputCompletedStatus: Bool, dayNumber: Int) {
        UserDefaults.standard.set(inputCompletedStatus, forKey: "completedStatusFor\(dayNumber)")
        Alldays[dayNumber].completed = inputCompletedStatus
    }
    func addConditionToUd(inputCondition: condEnum, dayNumber: Int) {
        UserDefaults.standard.set(inputCondition.rawValue, forKey: "conditionUdFor\(dayNumber)")
        Alldays[dayNumber].condition = inputCondition
    }
    func addFeelingsToUd(inputFeelings: Int, dayNumber: Int) {
        UserDefaults.standard.set(inputFeelings, forKey: "feelingsUDfor\(dayNumber)")
        Alldays[dayNumber].feelings = inputFeelings
    }
   
    
    func dateUpdateToUd(inputDateUpdate: Date, dayNumber: Int ) {
        UserDefaults.standard.set(inputDateUpdate, forKey:  "dateUpdateFor\(dayNumber)")
        Alldays[dayNumber].dateUpdate = inputDateUpdate
    }
    
    
    func clearUdDayConditions() {
        for i in 0...29 {
        addConditionToUd(inputCondition: .willcomplete, dayNumber: i)
        } }
}

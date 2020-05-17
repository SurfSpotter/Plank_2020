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
    
    
//    var dateOfStart: Date {
//        Calendar.dateComponents(Date())
//        let cd = Calendar.startOfDay(Date())
//        
//        return cd
//    }
    
    var dateStartMarathone: String {
    // 1) Create a DateFormatter() object.
      let format = DateFormatter()
       
      // 2) Set the current timezone to .current, or America/Chicago.
      format.timeZone = .current
       
      // 3) Set the format of the altered date.
    //  format.dateFormat = "yyyy-MM-ddxr"
        format.dateStyle = .short
       
      // 4) Set the current date, altered by timezone.
      let dateString = format.string(from: Date())
        return dateString
    }
   
     
     
  
    
/*
     var currentDate = Date()
      
      
     // 1) Create a DateFormatter() object.
     let format = DateFormatter()
      
     // 2) Set the current timezone to .current, or America/Chicago.
     format.timeZone = .current
      
     // 3) Set the format of the altered date.
     format.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
      
     // 4) Set the current date, altered by timezone.
     let dateString = format.string(from: currentDate)
     
     
     
     
     
     */
//    var dateOfStart: Date {
//        get {
//            var dateStart: Date?
//            dateStart = (UserDefaults.standard.object(forKey: "startMarathonDate")) as! Date
//            if dateStart != nil {
//                return dateStart!
//            }
//            else {
//                UserDefaults.standard.set(Date(), forKey:  "startMarathonDate")
//                return dateStart!
//            }
//        }
//        set {
//            UserDefaults.standard.set(Date(), forKey:  "startMarathonDate")
//        }
//    }
    
    
    
    
    // Создаем массив с включенными параметрами из UserDefaults
    func createTrainingDays() -> [Day] {
        Alldays.append(Day(numberDay: 0))
        UserDefaults.standard.bool(forKey: "completedUDfor0")
        for countOfDay in 1...30  {
            
            let DayCreated = Day(numberDay: countOfDay)
            DayCreated.completed = UserDefaults.standard.bool(forKey: "completedUDfor\(countOfDay)")
            DayCreated.condition = { () -> condEnum in
                
                switch  DayCreated.number {
                    
                    
                    
                // Устанавливаем дни отдыха
                case 6: return condEnum.rest
                case 13: return condEnum.rest
                case 19: return condEnum.rest
                case 26: return condEnum.rest
                    
                default:
                    
                    // получаем данные об остальных днях из UserDefaults
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
                }
                
                
                
                
                
                return condEnum.complete
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
        for i in 1...30 {
            addConditionToUd(inputCondition: .willcomplete, dayNumber: i)
        } }
    
    
}


//
//  WellDoneController.swift
//  Plank
//
//  Created by Алексей Чигарских on 10.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class WellDoneController: UIViewController {
    
    var actualDay: DayE?
    lazy var compareWithStartDate: Int? = Model().dateCompareDate(start_Date: trDays[1].dateUpdate , end_Date: actualDay?.dateUpdate)
    
    @IBOutlet weak var imgRingOut: UIImageView!
    @IBOutlet weak var topLabeOut: UILabel!
    @IBOutlet weak var bottomLabelOut: UILabel!
    @IBOutlet weak var dayNumOut: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgRingOut.isHidden = true

        dayNumOut.text = "\(actualDay!.dayNum)"
       
        
        //2
        if trDays[1].condition != "completed" && actualDay?.dayNum != 1 && actualDay?.condition != "rest" {
            /* 2.
             Первая тренировка не пройдена. Юзер нажал на другой день.  WellDone
             Если этот день обычный - пишем : Начните тренировки сегодня, и мы встретимся здесь через Н дней!
             
             */
            imgRingOut.isHidden = false
            imgRingOut.image = UIImage(named: "ImgTimerCircle")
            topLabeOut.text = "Начните тренироваться сегодня!"
            bottomLabelOut.text = "Нажмите в календаре на первый день!"
            
        }
        
        
       //2.1
        if actualDay?.dayNum == 1  && actualDay?.condition == "completed" && compareWithStartDate != nil || compareWithStartDate == 0  {
        
            topLabeOut.text = """
            Отличное начало!
            так держать!
            """
            bottomLabelOut.text = "Увидимся завтра?"
            imgRingOut.isHidden = false
            imgRingOut.image = UIImage(named: "DayCompleteBigImg")
            /*
              Первая тренировка пройдена. Юзер нажал на уже завершенный день
             -Открываем WellDone controller
             -Пишем : Так держать
             , увидимся завтра
             */
            
        
        }
            
     //2.2 Первая тренировка пройдена, юзер нажал на день отдыха.
            if trDays[1].condition == "completed" && actualDay?.dayNum != 1 && actualDay?.condition == "rest" {
            
            topLabeOut.text = "Это день отдыха"
            bottomLabelOut.text = "И вы совсем скоро до него дойдете!"
            imgRingOut.isHidden = false
            imgRingOut.image = UIImage(named: "DayRestBigImg")
        }
        
        //2.3
        if trDays[1].condition != "completed" && actualDay?.dayNum != 1 && actualDay?.condition == "rest" {
                   /* 2.3
                    Первая тренировка не пройдена. Юзер нажал на другой день.  WellDone
                   день отдыха - пишем: В этот день вы будете отдыхать.
                    
                    */
                   topLabeOut.text = "Начните тренироваться уже сегодня! \n Чтобы хорошо отдохнуть через"
                   bottomLabelOut.text = "дней!"
                    imgRingOut.isHidden = false
                   imgRingOut.image = UIImage(named: "DayRestBigImg")
               }
        
        
        
    }
    
    @IBAction func btn(_ sender: Any) {
        //imgRingOut.flashAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // imgRingOut.flashAnimation()
        
    }
    
    
}




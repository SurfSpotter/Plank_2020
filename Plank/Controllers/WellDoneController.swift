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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgRingOut.isHidden = true
        print(" compare \(Model().dateCompareDate(start_Date: actualDay?.dateUpdate, end_Date: actualDay?.dateUpdate))")
        
        
        
    //2.1
        if actualDay?.dayNum == 1 && compareWithStartDate != nil || compareWithStartDate == 0  {
           
        }
        
        
        

        
        
    }
    
    @IBAction func btn(_ sender: Any) {
        imgRingOut.flashAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        imgRingOut.flashAnimation()
    }
  

}




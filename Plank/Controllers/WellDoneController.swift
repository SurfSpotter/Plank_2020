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
    
    
    @IBOutlet weak var imgRingOut: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgRingOut.isHidden = true
        
    
        
        
//        print("actual day condition from WellDoneController is:")
//        print(actualDay?.condition)
        
        
    }
    
    @IBAction func btn(_ sender: Any) {
        imgRingOut.flashAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        imgRingOut.flashAnimation()
    }
  

}




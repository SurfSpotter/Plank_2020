//
//  SettingsController.swift
//  Plank
//
//  Created by Алексей Чигарских on 09.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var diffSliderOut: UISlider!
    @IBOutlet weak var diffSliderLaberOut: UILabel!
    @IBOutlet weak var diffSliderThumble: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func diffSliderAct(_ sender: Any) {
        print(Int(diffSliderOut.value))
        diffSliderLaberOut.text = "\(Int(diffSliderOut.value))" + "sec"
        self.diffSliderLaberOut.frame = CGRect(x: 106 + (Int(diffSliderOut.value)) , y: 36 , width: 60, height: 30)
        self.diffSliderThumble.frame = CGRect(x: 118 + (Int(diffSliderOut.value)) , y: 0 , width: 60, height: 30)
        
        
        /*

         if switchCondition { UIView.animate(withDuration: 0.21) {
             self.switchThumb.frame = CGRect(x: 32, y: 8, width: 43, height: 43)
             }
         }
             
         else { UIView.animate(withDuration: 0.21) {
             self.switchThumb.frame = CGRect(x: 6, y: 8, width: 43, height: 43)
             }
         }
         */
    }
    

}

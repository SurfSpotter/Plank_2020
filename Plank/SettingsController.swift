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
    
    
    
    override func viewWillLayoutSubviews() {
        self.diffSliderThumble.frame = CGRect(x: 118.0, y: 0 , width: 36, height: 38)
    
        
    }
    

    @IBAction func diffSliderAct(_ sender: Any) {
        print(Int(diffSliderOut.value))
        diffSliderLaberOut.text = "\(Int(diffSliderOut.value))" + "sec"
        self.diffSliderLaberOut.frame = CGRect(x: (106.0 + (Double(diffSliderOut.value)) * 0.85833333) , y: 36 , width: 67, height: 30)
        self.diffSliderThumble.frame = CGRect(x: (118.0 + Double(diffSliderOut.value) * 0.85833333) , y: 0 , width: 36, height: 38)
        
        
      
    }
    

}

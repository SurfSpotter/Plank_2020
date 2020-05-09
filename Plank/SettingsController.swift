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
    }
    

}

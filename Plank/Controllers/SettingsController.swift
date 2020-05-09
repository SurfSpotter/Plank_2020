//
//  SettingsController.swift
//  Plank
//
//  Created by Алексей Чигарских on 09.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    let sliderValueUD = UserDefaults.standard.integer(forKey: "secCorrection")
    
    
    @IBOutlet weak var diffSliderOut: UISlider!
    @IBOutlet weak var diffSliderLaberOut: UILabel!
    @IBOutlet weak var diffSliderThumble: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diffSliderOut.setValue(Float(sliderValueUD), animated: false)
        diffSliderLaberOut.text = sliderValStringUD
    }
    
    
    
    override func viewWillLayoutSubviews() {
        self.diffSliderLaberOut.frame = CGRect(x: (106.0 + (Double(sliderValueUD)) * 0.85833333) , y: 36 , width: 85, height: 30)
        self.diffSliderThumble.frame = CGRect(x: (118.0 + Double(sliderValueUD) * 0.85833333) , y: 0 , width: 36, height: 38)
    }
    

    @IBAction func diffSliderAct(_ sender: Any) {
        print(Int(diffSliderOut.value))
        diffSliderLaberOut.text = sliderValString
        self.diffSliderLaberOut.frame = CGRect(x: (106.0 + (Double(diffSliderOut.value)) * 0.85833333) , y: 36 , width: 85, height: 30)
        self.diffSliderThumble.frame = CGRect(x: (118.0 + Double(diffSliderOut.value) * 0.85833333) , y: 0 , width: 36, height: 38)
        UserDefaults.standard.set((Int(diffSliderOut.value)), forKey: "secCorrection")
        
      
    }
    
    @IBAction func cancelBtnAcion(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    
    
    
// Made custom string for slider with + and - and localised measures
    
    var sliderValStringUD: String {
        get { if sliderValueUD > 0 {
            return "+\(sliderValueUD)" + " sec"
            }
        else {  return "\(sliderValueUD)" + " sec"}
            }
        }
    
    var sliderValString: String {
        get { if (Int(diffSliderOut.value)) > 0 {
            return "+\(Int(diffSliderOut.value))" + " sec"
            }
        else {  return "\(Int(diffSliderOut.value))" + " sec"}
            }
        }


    
}

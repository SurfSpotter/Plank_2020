//
//  TimerController.swift
//  Plank
//
//  Created by Алексей Чигарских on 07.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import MBCircularProgressBar


@IBDesignable

class TimerController: UIViewController {
    
    var switchCondition: Bool = UserDefaults.standard.bool(forKey: "TickingSwitchCondition")

    @IBOutlet weak var progressBar: MBCircularProgressBarView!
    
    @IBOutlet weak var switchOut: UISwitch!
    @IBOutlet weak var switchThumb: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
   
}
   
    @IBAction func startBtnAct(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchBtnAct(_ sender: Any) {
        animateThumbOfSwitch()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("switchcondition: \(switchCondition)")
        switchOut.isOn = switchCondition
        
       
    }
    
    override func viewWillLayoutSubviews() {
        progressBar.layer.zPosition = 5
    
        
    }
    override func viewDidLayoutSubviews() {
        animateThumbOfSwitch()
    }
    
    // Animation and condition of Custom Switch and UserDefaults
    
    fileprivate func animateThumbOfSwitch() {
           let conditionNow = switchOut.isOn
           switchCondition = conditionNow
           if switchCondition { UIView.animate(withDuration: 0.21) {
               self.switchThumb.frame = CGRect(x: 32, y: 8, width: 43, height: 43)
               }
           }
               
           else { UIView.animate(withDuration: 0.21) {
               self.switchThumb.frame = CGRect(x: 6, y: 8, width: 43, height: 43)
               }
           }
        //UserDefaults.standard.bool(forKey: "TickingSwitchCondition")
        UserDefaults.standard.set(conditionNow, forKey: "TickingSwitchCondition")
       }
}


//
//  MainController.swift
//  Plank
//
//  Created by Алексей Чигарских on 03.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit





class CalendarController: UIViewController {
    
    @IBOutlet weak var butOut1: UIButton!
    @IBOutlet weak var butOut2: UIButton!
    @IBOutlet weak var butOut3: UIButton!
    @IBOutlet weak var butOut4: UIButton!
    @IBOutlet weak var butOut5: UIButton!
    @IBOutlet weak var butOut6: UIButton!
    @IBOutlet weak var butOut7: UIButton!
    @IBOutlet weak var butOut8: UIButton!
    @IBOutlet weak var butOut9: UIButton!
    @IBOutlet weak var butOut10: UIButton!
    @IBOutlet weak var butOut11: UIButton!
    @IBOutlet weak var butOut12: UIButton!
    @IBOutlet weak var butOut13: UIButton!
    @IBOutlet weak var butOut14: UIButton!
    @IBOutlet weak var butOut15: UIButton!
    @IBOutlet weak var butOut16: UIButton!
    @IBOutlet weak var butOut17: UIButton!
    @IBOutlet weak var butOut18: UIButton!
    @IBOutlet weak var butOut19: UIButton!
    @IBOutlet weak var butOut20: UIButton!
    @IBOutlet weak var butOut21: UIButton!
    @IBOutlet weak var butOut22: UIButton!
    @IBOutlet weak var butOut23: UIButton!
    @IBOutlet weak var butOut24: UIButton!
    @IBOutlet weak var butOut25: UIButton!
    @IBOutlet weak var butOut26: UIButton!
    @IBOutlet weak var butOut27: UIButton!
    @IBOutlet weak var butOut28: UIButton!
    @IBOutlet weak var butOut29: UIButton!
    @IBOutlet weak var butOut30: UIButton!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // but1Out.pulsate()
        
        
        
        
    }
    
    
        
    @IBAction func daysButtonsAction(sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }

        switch button.tag {
        case 1...30: print("button \(button.tag) pushed")
            // Do something
            animateSuperScale(button: button)
        default:
            print("Unknown button")
            return
        }
    }
    
    
    
    
    // MARK : Animate Functions
    
    
    
    // Анимация кнопки, когда нажимаешь, она увеличивается во весь экран, а далее должна открываться вьюха детализации
    func animateSuperScale(button: UIButton) {
        let but = button
        but.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.4, animations: {
            
            but.transform = CGAffineTransform(scaleX: 5, y: 5)
            but.alpha = 0.1
        }) { _ in
            
            but.alpha = 1.0
            but.transform = .identity
        }
        
    }
    
}

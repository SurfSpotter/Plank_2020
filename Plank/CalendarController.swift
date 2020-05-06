//
//  MainController.swift
//  Plank
//
//  Created by Алексей Чигарских on 03.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import EMTNeumorphicView




class CalendarController: UIViewController {
    
    
    @IBOutlet weak var but1Out: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        but1Out.pulsate()
        
        
        
        
    }
    
    
    @IBAction func but2Act(_ sender: Any) {
        animateSuperScale(button: but1Out)
        
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

//
//  Extensions.swift
//  Plank
//
//  Created by Алексей Чигарских on 06.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 10000
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 50000
        pulse.initialVelocity = 0.0001
        pulse.damping = 0
        layer.add(pulse, forKey: nil)
    }
    
    }

    /*
     
     
     UIView.animate(withDuration: 0.6,
     animations: {
         self.button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
     },
     completion: { _ in
         UIView.animate(withDuration: 0.6) {
             self.button.transform = CGAffineTransform.identity
         }
     })
     */
    


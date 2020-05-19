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


extension UIImageView {

    func flashAnimation() {
        self.isHidden = false
      let flash = CABasicAnimation(keyPath: "opacity")
        flash.fromValue = 0.1
        flash.toValue = 1.0
        flash.duration = 1.2
        flash.timingFunction = CAMediaTimingFunction(name: .easeIn)
        //flash.autoreverses = true
        //flash.repeatCount = 1
        layer.add(flash, forKey: nil)
    }
}
  
extension UIView {
    class func loadFromNib<T: UIView>() -> T {
        return  Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
}
}

extension Date {

    func totalDistance(from date: Date, resultIn component: Calendar.Component) -> Int? {
        return Calendar.current.dateComponents([component], from: self, to: date).value(for: component)
    }

    func compare(with date: Date, only component: Calendar.Component) -> Int {
        let days1 = Calendar.current.component(component, from: self)
        let days2 = Calendar.current.component(component, from: date)
        return days1 - days2
    }

    func hasSame(_ component: Calendar.Component, as date: Date) -> Bool {
        return self.compare(with: date, only: component) == 0
    }
}


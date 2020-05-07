//
//  TimerController.swift
//  Plank
//
//  Created by Алексей Чигарских on 07.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

@IBDesignable

class TimerController: UIViewController {

 
    
    let shapeLayer = CAShapeLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // lets do image fo timer
        
        let imageOfTimer = UIImageView(image: UIImage(named: "blankCircle"))
        imageOfTimer.frame.size = CGSize(width: 370, height: 370)
        
        imageOfTimer.center = view.center
        imageOfTimer.contentMode = .scaleToFill
        view.addSubview(imageOfTimer)
        
        
        
        // Do any additional setup after loading the view.
    
    
    // Let's shape a circle!
     
     
     let center = view.center
     let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
     shapeLayer.path = circularPath.cgPath
     shapeLayer.strokeColor = UIColor.blue.cgColor
     shapeLayer.lineWidth = 10
     shapeLayer.strokeEnd = 0
     shapeLayer.lineCap = .round
     shapeLayer.fillColor = UIColor.clear.cgColor
     
     
     
     
     // Track Line
     
     let trackLayer = CAShapeLayer()
     trackLayer.path = circularPath.cgPath
     trackLayer.strokeColor = UIColor.lightGray.cgColor
     trackLayer.lineWidth = 10
     trackLayer.lineCap = .round
     trackLayer.fillColor = UIColor.clear.cgColor
     
     
     
     
     view.layer.addSublayer(trackLayer)
     view.layer.addSublayer(shapeLayer)
    }
    
    
    override func viewWillLayoutSubviews() {
        
    }
}

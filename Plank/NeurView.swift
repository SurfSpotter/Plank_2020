//
//  TestNeur.swift
//  Plank
//
//  Created by Алексей Чигарских on 26.04.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import EMTNeumorphicView

@IBDesignable

class NeurView: UIView  {
    private let myView = EMTNeumorphicView()
    
    override func awakeFromNib() {
        
        myView.neumorphicLayer?.elementBackgroundColor = UIColor.yellow.cgColor
               myView.neumorphicLayer?.cornerRadius = 30
               // set convex or concave.
               myView.neumorphicLayer?.darkShadowOpacity = 1
        myView.neumorphicLayer?.depthType = .convex
               // set elementDepth (corresponds to shadowRadius). Default is 5
               myView.neumorphicLayer?.elementDepth = 5
              
            // Default is 1.
           myView.neumorphicLayer?.lightShadowOpacity = 1

           // Default is 0.3.
           myView.neumorphicLayer?.darkShadowOpacity = 1

           // Optional. if it is nil (default), elementBackgroundColor will be used as element color.
           myView.neumorphicLayer?.elementColor = nil
           
           // Adding a thin border on the edge of the element.
           myView.neumorphicLayer?.edged = true
        
        
           myView.frame = bounds
        
        
        // Text Label
        
               let textLable = UILabel()
               textLable.text = "Test"
               textLable.textColor = .black
               textLable.textAlignment = .center
               textLable.frame = myView.bounds
        
        
               
               self.addSubview(myView)
               self.addSubview(textLable)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = myView.neumorphicLayer!.cornerRadius
    }

}

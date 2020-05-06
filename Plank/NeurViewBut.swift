//
//  NeurViewBut.swift
//  Plank
//
//  Created by Алексей Чигарских on 03.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//



import UIKit
import EMTNeumorphicView

@IBDesignable

class NeurViewBut: UIView  {
    private let myView = EMTNeumorphicView()
    private var cornerRadForAllViews: CGFloat = 38
    var asdw = ""
    override func awakeFromNib() {
        
        myView.neumorphicLayer?.elementBackgroundColor = UIColor.yellow.cgColor
        myView.neumorphicLayer?.cornerRadius = cornerRadForAllViews
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
        
        

        // Button
        
        let button = UIButton(type: .roundedRect)
        button.setTitle("1", for: .normal)
        button.frame = myView.bounds
        button.addTarget(self, action: #selector(butPushSelect), for: .touchUpInside)
        
            
        //self.layer.cornerRadius = cornerRadForAllViews
        self.addSubview(myView)
        //self.addSubview(textLable)
        self.addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerRadForAllViews = self.bounds.width / 2
        self.layer.cornerRadius = cornerRadForAllViews
    }
    @objc func butPushSelect() {
        print (asdw)
    }
    
}


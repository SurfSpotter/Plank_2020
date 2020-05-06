//
//  NeurButton.swift
//  Plank
//
//  Created by Алексей Чигарских on 01.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import Foundation
import EMTNeumorphicView

@IBDesignable

class NeurButton: UIButton {
    
    
    let button1 = EMTNeumorphicButton(type: .custom)
    var button = EMTNeumorphicButton()
    var cornRadForAll: CGFloat = 23
    
    
    
    
    override func awakeFromNib() {
        
        
        button1.setImage(UIImage(named: "heart-outline"), for: .normal)
        button1.setImage(UIImage(named: "heart-solid"), for: .selected)
        button1.contentVerticalAlignment = .fill
        button1.contentHorizontalAlignment = .fill
        
        button1.addTarget(self, action: #selector(tapped) , for: .touchUpInside)
        button1.neumorphicLayer?.depthType = .convex
        //button1.neumorphicLayer?.elementBackgroundColor = self.backgroundColor?.cgColor as! CGColor
        button1.layer.cornerRadius = cornRadForAll
        button1.neumorphicLayer?.elementDepth = 5
        // Default is 1.
        button1.neumorphicLayer?.lightShadowOpacity = 1
        // Default is 0.3.
        button1.neumorphicLayer?.darkShadowOpacity = 1
        button1.frame = self.bounds
        self.addSubview(button1)
        
        
        
        
        
        
      
    }
    
    
    @objc func tapped(_ button: EMTNeumorphicButton) {
        // isSelected property changes neumorphicLayer?.depthType automatically
        button.isSelected = !button.isSelected
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button1.imageEdgeInsets = UIEdgeInsets(top: 26, left: 24, bottom: 22, right: 24)
        
  
        self.backgroundColor = .clear
    }
}

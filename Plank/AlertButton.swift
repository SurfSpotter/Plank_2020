//
//  AlertButton.swift
//  Plank
//
//  Created by Алексей Чигарских on 26.04.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import EMTNeumorphicView

@IBDesignable

class AlertButton: UIButton {

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 22
    }
   

}


/*

 
 let button = EMTNeumorphicButton(type: .custom)
 button.setImage(UIImage(named: "heart-outline"), for: .normal)
 button.setImage(UIImage(named: "heart-solid"), for: .selected)
 button.contentVerticalAlignment = .fill
 button.contentHorizontalAlignment = .fill
 button.imageEdgeInsets = UIEdgeInsets(top: 26, left: 24, bottom: 22, right: 24)
 button.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
 
 button.neumorphicLayer?.elementBackgroundColor = view.backgroundColor?.cgColor

 @objc func tapped(_ button: EMTNeumorphicButton) {
     // isSelected property changes neumorphicLayer?.depthType automatically
     button.isSelected = !button.isSelected
 }
 */

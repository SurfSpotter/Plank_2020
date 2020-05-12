//
//  AlertView.swift
//  Plank
//
//  Created by Алексей Чигарских on 11.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit

class AlertView: UIView {
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var alertDescription: UILabel!
    @IBOutlet weak var leftButtonOut: AlertButton!
    @IBOutlet weak var rightButtonOut: AlertButton!
    
    
    func set(Title: String, Description: String, LBut: String, RBut: String) {
        alertTitle.text = Title
        alertDescription.text = Description
        leftButtonOut.setTitle(LBut, for: .normal)
        rightButtonOut.setTitle(RBut, for: .normal)
    }
  

}

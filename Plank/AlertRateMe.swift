//
//  AlertRateMe.swift
//  Plank
//
//  Created by Алексей Чигарских on 12.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit



class AlertRateMe: UIView {
    
    @IBOutlet weak var titleOut: UILabel!
    @IBOutlet weak var leftBtnOut: UIButton!
    @IBOutlet weak var rightBtnOut: UIButton!
    
    
    

    func settings( title: String) {
        titleOut.text = title
    }
}

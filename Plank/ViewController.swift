//
//  ViewController.swift
//  Plank
//
//  Created by Алексей Чигарских on 25.04.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import EMTNeumorphicView



class ViewController: UIViewController {

    @IBOutlet weak var buttonOut: NeurButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        buttonOut.button.neumorphicLayer?.depthType = .convex
        
    }
}





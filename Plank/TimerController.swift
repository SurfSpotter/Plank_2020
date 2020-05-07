//
//  TimerController.swift
//  Plank
//
//  Created by Алексей Чигарских on 07.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit
import MBCircularProgressBar


@IBDesignable

class TimerController: UIViewController {

    @IBOutlet weak var progressBar: MBCircularProgressBarView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

   
}

    override func viewWillLayoutSubviews() {
        progressBar.layer.zPosition = 5
    }
}


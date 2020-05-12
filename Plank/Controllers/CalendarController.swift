//
//  MainController.swift
//  Plank
//
//  Created by Алексей Чигарских on 03.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit





class CalendarController: UIViewController {
    
    @IBOutlet weak var butOut1: UIButton!
    @IBOutlet weak var butOut2: UIButton!
    @IBOutlet weak var butOut3: UIButton!
    @IBOutlet weak var butOut4: UIButton!
    @IBOutlet weak var butOut5: UIButton!
    @IBOutlet weak var butOut6: UIButton!
    @IBOutlet weak var butOut7: UIButton!
    @IBOutlet weak var butOut8: UIButton!
    @IBOutlet weak var butOut9: UIButton!
    @IBOutlet weak var butOut10: UIButton!
    @IBOutlet weak var butOut11: UIButton!
    @IBOutlet weak var butOut12: UIButton!
    @IBOutlet weak var butOut13: UIButton!
    @IBOutlet weak var butOut14: UIButton!
    @IBOutlet weak var butOut15: UIButton!
    @IBOutlet weak var butOut16: UIButton!
    @IBOutlet weak var butOut17: UIButton!
    @IBOutlet weak var butOut18: UIButton!
    @IBOutlet weak var butOut19: UIButton!
    @IBOutlet weak var butOut20: UIButton!
    @IBOutlet weak var butOut21: UIButton!
    @IBOutlet weak var butOut22: UIButton!
    @IBOutlet weak var butOut23: UIButton!
    @IBOutlet weak var butOut24: UIButton!
    @IBOutlet weak var butOut25: UIButton!
    @IBOutlet weak var butOut26: UIButton!
    @IBOutlet weak var butOut27: UIButton!
    @IBOutlet weak var butOut28: UIButton!
    @IBOutlet weak var butOut29: UIButton!
    @IBOutlet weak var butOut30: UIButton!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // but1Out.pulsate()
        
        
        
        
    }
    
    
        
    @IBAction func daysButtonsAction(sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }

        switch button.tag {
        case 1...30: print("button \(button.tag) pushed")
            // Do something
        animateAlertIn()
        
            animateSuperScale(button: button)

        default:
            print("Unknown button")
            return
        }
    }
    
    
    

       
        // MARK:- Custom Rate Alert:
        // Кастомный алерт инициализация
         private lazy var alertRate: AlertRateMe = {
             let alertRate: AlertRateMe = AlertRateMe.loadFromNib()
             return alertRate
             
         }()
         // View которая при показе алерта делает экран полупрозрачным
         let alphaView : UIView = {
             let alphaView = UIView()
             alphaView.backgroundColor = .white
             alphaView.alpha = 0.4
             return alphaView
         }()
        
        // load Custom AlertView
        
        func customRateView() {
            
            setup_alphaView()
            view.addSubview(alertRate)
           // alertView.frame.size.width =  view.bounds.width / 1.2
            alertRate.center = view.center
            alertRate.leftBtnOut.addTarget(self, action: #selector(letfButtonPressed), for: .touchUpInside)
            alertRate.rightBtnOut.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
        }
        
        // функци крепления alphaView - засветления фона
        func setup_alphaView() {
            view.addSubview(alphaView)
            alphaView.frame = view.bounds
        }
        
        // Селекторы для кнопок алерта
        
        @objc func letfButtonPressed() {
            print("User doesn't like it app")
            animateAlertOut()
        }
        
        @objc func rightButtonPressed() {
            
            // call rate Manager Here!
            
            print("User like it app")
        }
        
        
        // Анимация кастомного алерта
        
        func animateAlertIn() {
            customRateView()
            alertRate.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            alertRate.alpha = 0
            
            UIView.animate(withDuration: 0.4) {
                self.alphaView.alpha = 0.5
                self.alertRate.alpha = 1.0
                self.alertRate.transform = CGAffineTransform.identity
            }    }
        
        
        func animateAlertOut() {
            
            UIView.animate(withDuration: 0.4, animations: {
                self.alertRate.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
                self.alertRate.alpha = 0
                self.alphaView.alpha = 0
            }) { (_) in
                self.alphaView.removeFromSuperview()
                self.alertRate.removeFromSuperview()
            }
        }
        
        
        
    
    
    
    
    // MARK:- Animate Functions
    
    
    
    // Анимация кнопки, когда нажимаешь, она увеличивается во весь экран, а далее должна открываться вьюха детализации
    func animateSuperScale(button: UIButton) {
        let but = button
        but.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.4, animations: {
            
            but.transform = CGAffineTransform(scaleX: 5, y: 5)
            but.alpha = 0.1
        }) { _ in
            
            but.alpha = 1.0
            but.transform = .identity
        }
        
    }
    
}

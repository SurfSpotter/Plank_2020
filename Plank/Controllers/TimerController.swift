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

    var actualDay: DayE?
    var startDate: Date?
    
    var switchCondition: Bool = UserDefaults.standard.bool(forKey: "TickingSwitchCondition")
    @IBOutlet weak var progressBar: MBCircularProgressBarView!
    @IBOutlet weak var switchOut: UISwitch!
    @IBOutlet weak var switchThumb: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let actualDay = actualDay {
           
        }
        
        
    }
    
    @IBAction func closeBtnAction(_ sender: Any) {
        
        
        animateAlertIn()
    }
    @IBAction func startBtnAct(_ sender: Any) {
        
//        if startDate == nil {
//            startDate = ((UserDefaults.standard.set(Date(), forKey: "startDate")) as! Date)
//        }
//        
//        else {
//            //UserDefaults.standard.object(forKey: "startDate")
//            print( "start date is already created")
//        }
           
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func switchBtnAct(_ sender: Any) {
        animateThumbOfSwitch()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("switchcondition: \(switchCondition)")
        switchOut.isOn = switchCondition
       // print("actual day is: \(actualDay!.number)")
        
    }
    
    override func viewWillLayoutSubviews() {
        progressBar.layer.zPosition = 5
        
        
    }
    override func viewDidLayoutSubviews() {
        animateThumbOfSwitch()
    }
    
    

 // MARK:- Custom Alert:
    
    // Кастомный алерт инициализация
     private lazy var alertView: AlertView = {
         let alertView: AlertView = AlertView.loadFromNib()
         return alertView
         
     }()
     
     
     // View которая при показе алерта делает экран полупрозрачным
     let alphaView : UIView = {
         let alphaView = UIView()
         alphaView.backgroundColor = .white
         alphaView.alpha = 0.4
         return alphaView
     }()
    
    // load Custom AlertView
    
    func customAlertView() {
        
        setup_alphaView()
        view.addSubview(alertView)
        
        //alertView.set(Title: <#T##String#>, Description: <#T##String#>, LBut: <#T##String#>, RBut: <#T##String#>) // кастомное название
       // alertView.frame.size.width =  view.bounds.width / 1.2
        alertView.center = view.center
        alertView.leftButtonOut.addTarget(self, action: #selector(letfButtonPressed), for: .touchUpInside)
        alertView.rightButtonOut.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
    }
    
    // функци крепления alphaView - засветления фона
    func setup_alphaView() {
        view.addSubview(alphaView)
        alphaView.frame = view.bounds
    }
    
    // Селекторы для кнопок алерта
    
    @objc func letfButtonPressed() {
        print("leftButton is pressed")
        animateAlertOut()
    }
    
    @objc func rightButtonPressed() {
        print("rightButton is pressed")
    }
    
    
    // Анимация кастомного алерта
    
    func animateAlertIn() {
        customAlertView()
        alertView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.alphaView.alpha = 0.5
            self.alertView.alpha = 1.0
            self.alertView.transform = CGAffineTransform.identity
        }    }
    
    
    func animateAlertOut() {
        
        UIView.animate(withDuration: 0.4, animations: {
            self.alertView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.alertView.alpha = 0
            self.alphaView.alpha = 0
        }) { (_) in
            self.alphaView.removeFromSuperview()
            self.alertView.removeFromSuperview()
        }
    }
    
   
    
    
    
 //MARK: - Custom Switch
    
    // анимация кастомного увеличенного ползунка у UISwitch
    
    fileprivate func animateThumbOfSwitch() {
        let conditionNow = switchOut.isOn
        switchCondition = conditionNow
        if switchCondition { UIView.animate(withDuration: 0.21) {
            self.switchThumb.frame = CGRect(x: 32, y: 8, width: 43, height: 43)
            }
        }
            
        else { UIView.animate(withDuration: 0.21) {
            self.switchThumb.frame = CGRect(x: 6, y: 8, width: 43, height: 43)
            }
        }
        //UserDefaults.standard.bool(forKey: "TickingSwitchCondition")
        UserDefaults.standard.set(conditionNow, forKey: "TickingSwitchCondition")
    }
}


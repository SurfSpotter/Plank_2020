//
//  MainController.swift
//  Plank
//
//  Created by Алексей Чигарских on 03.05.2020.
//  Copyright © 2020 Алексей Чигарских. All rights reserved.
//

import UIKit





class CalendarController: UIViewController {
    
    @IBOutlet var dayButtonsOUt: [UIButton]!
    
    var model = Model()
    var selectedDay: DayE?
    var startDate: Date?
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
         //  let _ = model.createTrainingDays()
        
       
            
        for i in trDays {
            print(i.dayNum)
        }
        
        print("trDays: \(trDays.count)")
        
     
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setBtnImgFromConditon()
    }
    
    
    
    @IBAction func daysButtonsAction(sender: AnyObject) {
        guard let button = sender as? UIButton else {
            return
        }
        switch button.tag {
        case 1...30: print("button \(button.tag) pushed")
        animateSuperScale(button: button) // анимация при нажатии на кнопку дня в календаре
        selectedDay = trDays[button.tag]
        
        //1
        if button.tag == 1 && selectedDay?.condition != "complete"
        {performSegue(withIdentifier: "goToTimerController", sender: self)}
        
        
        //2.1
        if button.tag == 1 && selectedDay?.condition == "complete" {
            performSegue(withIdentifier: "goToWellDoneController", sender: self)
        }
            

        default:
            print("Unknown button")
            return
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTimerController" {
            (segue.destination as! TimerController).actualDay = selectedDay
        }
        if segue.identifier == "goToWellDoneController" {
            (segue.destination as! WellDoneController).actualDay = selectedDay
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
    
    func setBtnImgFromConditon() {
     //    функция устанавливает нужнную картинку кнопки исходя их состояния текущего дня
    for button in dayButtonsOUt {
//        print(button.tag)
       // print("alldays Count")
      //  print(model.Alldays.count)
        switch (trDays[(button.tag)].condition) {
        case "complete" :
            button.setBackgroundImage(UIImage(named: "buttonDayComplete"), for: .normal)
        case "passed" :
            button.setBackgroundImage(UIImage(named: "buttonDayPass"), for: .normal)
        case "rest" :
            button.setBackgroundImage(UIImage(named: "buttonDayRest"), for: .normal)
        case "willcomplete" :
             button.setBackgroundImage(UIImage(named: "blankCircle"), for: .normal)

        default : "print unknown confition of day"
        }
    }
    
    
   
    
    
    }
    
}

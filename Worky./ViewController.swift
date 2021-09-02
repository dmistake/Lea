//
//  ViewController.swift
//  Worky.
//
//  Created by Александр Головин on 27.01.2021.
//

import LocalAuthentication
import UIKit

class ViewController: UIViewController {
    
    let hour = Calendar.current.component(.hour, from: Date())
    let minute = Calendar.current.component(.minute, from: Date())
    let second = Calendar.current.component(.second, from: Date())
    
    let dateFormatted = DateFormatter()
    var timer = Timer()
    
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var dotsLabel: UILabel!
    @IBOutlet weak var dayLable: UILabel!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главное меню"
        if UserModel.shared.userWantToScan == true {
            LocalAuthenticationFunction()
        }
        CurrentDayOfTheWeek()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSecondsLabel), userInfo: nil, repeats: true)
        helloLabel.alpha = 0
        if UserModel.shared.userSecondName != "" {
            helloLabel.alpha = 1
            helloLabel.text = "Приветствую, \(String(describing: UserModel.shared.userSecondName))"
        } else { helloLabel.alpha = 0 }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if UserModel.shared.userSecondName != "" && UserModel.shared.userSecondName != nil {
            if let model = UserModel.shared.userSecondName {
                helloLabel.alpha = 1
                helloLabel.text = "Приветствую, \(model)"
            }
        } else { helloLabel.alpha = 0 }
        self.reloadInputViews()
    }
    
    func LocalAuthenticationFunction() {
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Пожалуйста, авторизуйтесь!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        let allert = UIAlertController(title: "Аутентификация не выполнена", message: "", preferredStyle: .alert)
                        allert.addAction(UIAlertAction(title: "Попробовать снова", style: .cancel, handler: nil))
                        self?.present(allert, animated: true)
                        fatalError()
                    }
                }
            }
        } else {
            let allert = UIAlertController(title: "В доступе отказано!", message: "Неавторизованный пользователь!", preferredStyle: .alert)
            allert.addAction(UIAlertAction(title: "Отказ", style: .cancel, handler: nil))
            present(allert, animated: true)
        }
    }
    
    
    @objc func updateSecondsLabel() {
        let hour = Calendar.current.component(.hour, from: Date())
        let minute = Calendar.current.component(.minute, from: Date())
        let second = Calendar.current.component(.second, from: Date())
        
        if hour < 10 {
            hourLabel.text = "0" + String(hour)
        } else {
            hourLabel.text = String(hour)
        }
        if minute < 10 {
            minuteLabel.text = "0" + String(minute)
        } else {
            minuteLabel.text = String(minute)
        }
        if second < 10 {
            secondsLabel.text = "0" + String(second)
        } else {
            secondsLabel.text = String(second)
        }
        if second % 2 == 0 {
            dotsLabel.isEnabled = false
        } else {
            dotsLabel.isEnabled = true
        }
    }
    
    func CurrentDayOfTheWeek() {
        if Calendar.current.component(.weekday, from: Date()) == 2 {
            dayLable.text = "Сегодня понедельник, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 3 {
            dayLable.text = "Сегодня вторник, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 4 {
            dayLable.text = "Сегодня среда, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 5 {
            dayLable.text = "Сегодня четверг, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 6 {
            dayLable.text = "Сегодня пятница, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 7 {
            dayLable.text = "Сегодня суббота, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 8 {
            dayLable.text = "Сегодня воскресенье, " + String(Date.getCurrentDate())
        }
    }
    
}
extension Date {
    
    static func getCurrentDate() -> String {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        return dateFormatter.string(from: Date())
        
    }
}





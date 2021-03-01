//
//  ViewController.swift
//  Worky.
//
//  Created by Александр Головин on 27.01.2021.
//

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главное меню"
        CurrentDayOfTheWeek()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSecondsLabel), userInfo: nil, repeats: true)
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
            dayLable.text = "Понедельник, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 3 {
            dayLable.text = "Вторник, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 4 {
            dayLable.text = "Среда, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 5 {
            dayLable.text = "Четверг, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 6 {
            dayLable.text = "Пятница, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 7 {
            dayLable.text = "Суббота, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 8 {
            dayLable.text = "Воскресенье, " + String(Date.getCurrentDate())
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





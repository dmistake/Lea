//
//  MOBI300.swift
//  Worky.
//
//  Created by Александр Головин on 18.03.2021.
//

import UIKit

class MOBI300: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NextButtonOutlet: UIButton!
    @IBOutlet weak var BackButtonOutlet: UIButton!
    
    var rowNumber = 1
    var timer:Timer?
    var timeLeft = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "МОБИ-300"
        BackButtonOutlet.isEnabled = false
        NextButtonOutlet.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires()
    {
        timeLeft -= 1
        if timeLeft >= 0 {
            if timeLeft == 24 {
                UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromRight, animations: { self.ImageView.image = UIImage(named: "МОБИ-3002") }, completion: nil)
                self.BackButtonOutlet.isEnabled = true
                self.NextButtonOutlet.isEnabled = true
            }
            if timeLeft == 21 {
                UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromRight, animations: { self.ImageView.image = UIImage(named: "МОБИ-3003") }, completion: nil)
                self.BackButtonOutlet.isEnabled = true
                self.NextButtonOutlet.isEnabled = true
            }
            if timeLeft == 18 {
                UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromRight, animations: { self.ImageView.image = UIImage(named: "МОБИ-3004") }, completion: nil)
                self.BackButtonOutlet.isEnabled = true
                self.NextButtonOutlet.isEnabled = true
            }
            if timeLeft == 14 { UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromRight, animations: { self.ImageView.image = UIImage(named: "МОБИ-3005") }, completion: nil)
                self.BackButtonOutlet.isEnabled = true
                self.NextButtonOutlet.isEnabled = false
            }
            if timeLeft == 10 { UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromLeft, animations: { self.ImageView.image = UIImage(named: "МОБИ-3001") }, completion: nil)
                self.BackButtonOutlet.isEnabled = false
                self.NextButtonOutlet.isEnabled = true
            }
        }
        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @IBAction func NextButton(_ sender: Any) {
        rowNumber += 1
            if rowNumber == 2 {
                UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromRight, animations: { self.ImageView.image = UIImage(named: "МОБИ-3002") }, completion: nil)
                BackButtonOutlet.isEnabled = true
                NextButtonOutlet.isEnabled = true
            }
        if rowNumber == 3 {
            UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromRight, animations: { self.ImageView.image = UIImage(named: "МОБИ-3003") }, completion: nil)
            BackButtonOutlet.isEnabled = true
            NextButtonOutlet.isEnabled = true
        }
        if rowNumber == 4 {
            UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromRight, animations: { self.ImageView.image = UIImage(named: "МОБИ-3004") }, completion: nil)
            BackButtonOutlet.isEnabled = true
            NextButtonOutlet.isEnabled = true
        }
        if rowNumber == 5 {
            UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromRight, animations: { self.ImageView.image = UIImage(named: "МОБИ-3005") }, completion: nil)
            BackButtonOutlet.isEnabled = true
            NextButtonOutlet.isEnabled = false
        }
    }
    @IBAction func BackButton(_ sender: Any) {
        rowNumber -= 1
        if rowNumber == 1 {
            UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromLeft, animations: { self.ImageView.image = UIImage(named: "МОБИ-3001") }, completion: nil)
            BackButtonOutlet.isEnabled = false
            NextButtonOutlet.isEnabled = true
        }
        if rowNumber == 2 {
            UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromLeft, animations: { self.ImageView.image = UIImage(named: "МОБИ-3002") }, completion: nil)
            BackButtonOutlet.isEnabled = true
            NextButtonOutlet.isEnabled = true
        }
        if rowNumber == 3 {
            UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromLeft, animations: { self.ImageView.image = UIImage(named: "МОБИ-3003") }, completion: nil)
            BackButtonOutlet.isEnabled = true
            NextButtonOutlet.isEnabled = true
        }
        if rowNumber == 4 {
            UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromLeft, animations: { self.ImageView.image = UIImage(named: "МОБИ-3004") }, completion: nil)
            BackButtonOutlet.isEnabled = true
            NextButtonOutlet.isEnabled = true
        }
    }
    
}

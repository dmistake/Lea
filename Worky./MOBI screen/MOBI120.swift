//
//  MOBI120.swift
//  Worky.
//
//  Created by Александр Головин on 18.03.2021.
//

import UIKit

class MOBI120: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var NextButtonOutlet: UIButton!
    @IBOutlet weak var BackButtonOutlet: UIButton!
    
    var rowNumber = 1
    var timer:Timer?
    var timeLeft = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "МОБИ-120"
        BackButtonOutlet.isEnabled = false
        NextButtonOutlet.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    @objc func onTimerFires()
    {
        timeLeft -= 1
        if timeLeft >= 0 {
            if timeLeft == 4 {
                UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromRight, animations: { self.ImageView.image = UIImage(named: "МОБИ-1202") }, completion: nil)
                self.BackButtonOutlet.isEnabled = true
                self.NextButtonOutlet.isEnabled = false
            }
            if timeLeft == 2 { UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromLeft, animations: { self.ImageView.image = UIImage(named: "МОБИ-1201") }, completion: nil)
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
                UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromRight, animations: { self.ImageView.image = UIImage(named: "МОБИ-1202") }, completion: nil)
                BackButtonOutlet.isEnabled = true
                NextButtonOutlet.isEnabled = false
            }
            if rowNumber != 2 {
                BackButtonOutlet.isEnabled = true
                NextButtonOutlet.isEnabled = true
            }
    }
    @IBAction func BackButton(_ sender: Any) {
        rowNumber -= 1
        if rowNumber == 1 {
            UIView.transition(with: self.ImageView, duration: 1.0, options: .transitionFlipFromLeft, animations: { self.ImageView.image = UIImage(named: "МОБИ-1201") }, completion: nil)
            BackButtonOutlet.isEnabled = false
            NextButtonOutlet.isEnabled = true
        }
        if rowNumber != 1 {
            BackButtonOutlet.isEnabled = true
            NextButtonOutlet.isEnabled = true
        }
    }
    
}

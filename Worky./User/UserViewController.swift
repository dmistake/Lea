//
//  UserViewController.swift
//  Worky.
//
//  Created by Александр Головин on 04.03.2021.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var thirdNameTextField: UITextField!
    @IBOutlet weak var telTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var BackGView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Пользователь"
        BackGView.layer.cornerRadius = 8
        firstNameTextField.text = UserModel.shared.userFirstName
        secondNameTextField.text = UserModel.shared.userSecondName
        thirdNameTextField.text = UserModel.shared.userThirdName
        telTextField.text = UserModel.shared.userTel
        mailTextField.text = UserModel.shared.userMail
        addressTextField.text = UserModel.shared.userAddress
        if UserModel.shared.userWantToScan == true {
            switchOutlet.isOn = true
        } else {
            switchOutlet.isOn = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        firstNameTextField.text = UserModel.shared.userFirstName
        secondNameTextField.text = UserModel.shared.userSecondName
        thirdNameTextField.text = UserModel.shared.userThirdName
        telTextField.text = UserModel.shared.userTel
        mailTextField.text = UserModel.shared.userMail
        addressTextField.text = UserModel.shared.userAddress
    }
    
    // Here should be an animation
    private let stackView: UIStackView = {
            $0.distribution = .fill
            $0.axis = .horizontal
            $0.alignment = .center
            $0.spacing = 10
            return $0
        }(UIStackView())

        private let circleA = UIView()
        private let circleB = UIView()
        private let circleC = UIView()
        private lazy var circles = [circleA, circleB, circleC]

        func animate() {
            view.addSubview(stackView)
                    stackView.translatesAutoresizingMaskIntoConstraints = false
                    stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                    stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                    circles.forEach {
                        $0.layer.cornerRadius = 20/2
                        $0.layer.masksToBounds = true
                        $0.backgroundColor = .systemBlue
                        stackView.addArrangedSubview($0)
                        $0.widthAnchor.constraint(equalToConstant: 20).isActive = true
                        $0.heightAnchor.constraint(equalTo: $0.widthAnchor).isActive = true
                    }
            let jumpDuration: Double = 0.30
            let delayDuration: Double = 1.25
            let totalDuration: Double = delayDuration + jumpDuration*2

            let jumpRelativeDuration: Double = jumpDuration / totalDuration
            let jumpRelativeTime: Double = delayDuration / totalDuration
            let fallRelativeTime: Double = (delayDuration + jumpDuration) / totalDuration

            for (index, circle) in circles.enumerated() {
                let delay = jumpDuration*2 * TimeInterval(index) / TimeInterval(circles.count)
                UIView.animateKeyframes(withDuration: totalDuration, delay: delay, options: [.repeat], animations: {
                    UIView.addKeyframe(withRelativeStartTime: jumpRelativeTime, relativeDuration: jumpRelativeDuration) {
                        circle.frame.origin.y -= 30
                    }
                    UIView.addKeyframe(withRelativeStartTime: fallRelativeTime, relativeDuration: jumpRelativeDuration) {
                        circle.frame.origin.y += 30
                    }
                })
            }
        }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func Switch(_ sender: UISwitch) {
        if sender.isOn {
            UserModel.shared.userWantToScan = true
            let alertController = UIAlertController(title: "Биометрия включена.", message:
                                                        "Для вступления изменений в силу перезагрузите приложение", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Понятно", style: .default))
            self.present(alertController, animated: true, completion: nil)
        } else {
            UserModel.shared.userWantToScan = false
            let alertController = UIAlertController(title: "Биометрия отключена.", message:
                                                        "Для вступления изменений в силу перезагрузите приложение", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Понятно", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func SaveButton(_ sender: Any) {
        
        if firstNameTextField.text == "" || secondNameTextField.text == "" || thirdNameTextField.text == "" || telTextField.text == "" || mailTextField.text == "" || addressTextField.text == "" {
//            animate()
            let alert = UIAlertController(title: "Одно или несколько полей пустые. Вы действительно хотите сохранить форму?", message: "Будет выполнено сохранение всех полей.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
                                            self.view.layer.removeAllAnimations()
                                            if self.firstNameTextField.text != "" {
                                                UserModel.shared.userFirstName = self.firstNameTextField.text
                                            }
                                            if self.secondNameTextField.text != "" {
                                                UserModel.shared.userSecondName = self.secondNameTextField.text
                                            }
                                            if self.thirdNameTextField.text != "" {
                                                UserModel.shared.userThirdName = self.thirdNameTextField.text
                                            }
                                            if self.telTextField.text != "" {
                                                UserModel.shared.userTel = self.telTextField.text
                                            }
                                            if self.mailTextField.text != "" {
                                                UserModel.shared.userMail = self.mailTextField.text
                                            }
                                            if self.addressTextField.text != "" {
                                                UserModel.shared.userAddress = self.addressTextField.text
                                            }
                                            self.reloadInputViews() }))
            alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            self.view.layer.removeAllAnimations()
            if firstNameTextField.text != "" {
                UserModel.shared.userFirstName = firstNameTextField.text
            }
            if secondNameTextField.text != "" {
                UserModel.shared.userSecondName = secondNameTextField.text
            }
            if thirdNameTextField.text != "" {
                UserModel.shared.userThirdName = thirdNameTextField.text
            }
            if telTextField.text != "" {
                UserModel.shared.userTel = telTextField.text
            }
            if mailTextField.text != "" {
                UserModel.shared.userMail = mailTextField.text
            }
            if addressTextField.text != "" {
                UserModel.shared.userAddress = addressTextField.text
            }
            let alertController = UIAlertController(title: "Данные успешно сохранены.", message:
                                                        "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Продолжить", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func DeleteButton(_ sender: Any) {
        if firstNameTextField.text != "" || secondNameTextField.text != "" || thirdNameTextField.text != "" {
//            animate()
            let alert = UIAlertController(title: "Вы действительно хотите удалить все данные?", message: "Данное действие не обратимо. Данное действие очистит все поля и удалит всю введенную ранее информацию.", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
                                            self.view.layer.removeAllAnimations()
                                            self.firstNameTextField.text = ""
                                            self.secondNameTextField.text = ""
                                            self.thirdNameTextField.text = ""
                                            self.telTextField.text = ""
                                            self.mailTextField.text = ""
                                            self.addressTextField.text = ""
                                            
                                            UserModel.shared.userFirstName = self.firstNameTextField.text
                                            UserModel.shared.userSecondName = self.secondNameTextField.text
                                            UserModel.shared.userThirdName = self.thirdNameTextField.text
                                            UserModel.shared.userTel = self.telTextField.text
                                            UserModel.shared.userMail = self.mailTextField.text
                                            UserModel.shared.userAddress = self.addressTextField.text
                                            self.reloadInputViews() }))
            alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        } else {
            self.view.layer.removeAllAnimations()
            let alertController = UIAlertController(title: "Нечего удалять.", message:
                                                        "Все поля пустые", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Понятно", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}

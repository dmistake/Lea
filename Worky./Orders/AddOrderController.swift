//
//  AddOrderController.swift
//  Worky.
//
//  Created by Александр Головин on 12.04.2021.
//

import UIKit

class AddOrderController: UIViewController {

    @IBOutlet weak var DateTextField: UITextField!
    @IBOutlet weak var ClientTextField: UITextField!
    @IBOutlet weak var OrderTextField: UITextField!
    @IBOutlet weak var PriceTextField: UITextField!
    @IBOutlet weak var DocTextField: UITextField!
    @IBOutlet weak var SaveButtonOutlet: UIBarButtonItem!
    
    let dateFormatted = DateFormatter()
    var day = ""
    var pickerView = UIPickerView()
    var clientPickerView = UIPickerView()
    
    let machinesArray: [String] = ["Моби-120", "Моби-160", "Моби-200", "Моби-201", "Моби-250", "Моби-261", "Моби-300"]
    
    let hour = ViewController().hour
    let min = ViewController().minute
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CurrentDayOfTheWeek()
        let hour = ViewController().hour
        let min = ViewController().minute
        DateTextField.text = "\(String(describing: day)) \(String(describing: hour)):\(String(describing: min))"
        pickerView.delegate = self
        pickerView.dataSource = self
        clientPickerView.delegate = self
        clientPickerView.dataSource = self
        OrderTextField.inputView = pickerView
        ClientTextField.inputView = clientPickerView
        
        pickerView.tag = 1
        clientPickerView.tag = 2
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesEnded(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func SaveButton(_ sender: Any) {
        if DateTextField.text == "" || ClientTextField.text == "" || OrderTextField.text == "" || PriceTextField.text == "" || DocTextField.text == "" {
            let alert = UIAlertController(title: "Одно или несколько полей пустые. Вы действительно хотите сохранить форму?", message: "Будет выполнено сохранение всех полей.", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { action in
                                            if let date = self.DateTextField.text {
                                                if let client = self.ClientTextField.text {
                                                    if let order = self.OrderTextField.text {
                                                        if let price = self.PriceTextField.text {
                                                            if let doc = self.DocTextField.text {
                                                                ModelData.shared.Add(date: date, clientName: client, Order: order, price: price, doc: doc)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            self.reloadInputViews() }))
            alert.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        } else {
            
            if let date = DateTextField.text {
                if let client = ClientTextField.text {
                    if let order = OrderTextField.text {
                        if let price = PriceTextField.text {
                            if let doc = DocTextField.text {
                                ModelData.shared.Add(date: date, clientName: client, Order: order, price: price, doc: doc)
                            }
                        }
                    }
                }
            }
            
            let alertController = UIAlertController(title: "Данные успешно сохранены.", message:
                                                        "", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Продолжить", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    func CurrentDayOfTheWeek() {
        if Calendar.current.component(.weekday, from: Date()) == 2 {
            day = "Понедельник, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 3 {
            day = "Вторник, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 4 {
            day = "Среда, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 5 {
            day = "Четверг, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 6 {
            day = "Пятница, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 7 {
            day = "Суббота, " + String(Date.getCurrentDate())
        }
        if Calendar.current.component(.weekday, from: Date()) == 8 {
            day = "Воскресенье, " + String(Date.getCurrentDate())
        }
    }
    
}

extension AddOrderController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return machinesArray.count
        case 2:
            return ClientData().ArrayCount()
        default:
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return machinesArray[row]
        case 2:
            return ClientData().Render()[row]
        default:
            return "error"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            OrderTextField.text = machinesArray[row]
            OrderTextField.resignFirstResponder()
        case 2:
            ClientTextField.text = ClientData().Render()[row]
            ClientTextField.resignFirstResponder()
        default:
            ""
        }
        
    }
    
}

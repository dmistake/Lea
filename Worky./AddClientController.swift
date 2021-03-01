//
//  AddClientController.swift
//  Worky.
//
//  Created by Александр Головин on 03.02.2021.
//

import UIKit

class AddClientController: UIViewController {
    
    var name1 = ""
    var name2 = ""
    var name3 = ""
    var money1 = ""

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var thirdNameTextField: UITextField!
    @IBOutlet weak var hourRateTextField: UITextField!
    
    @IBOutlet weak var SaveButton: UIButton!
    @IBAction func SaveButtonPressed(_ sender: Any) {
        if nameTextField.text != "" {
            name1 = nameTextField.text!
        } else {
            nameTextField.text = ""
        }
        if surnameTextField.text != "" {
            name2 = surnameTextField.text!
        } else {
            surnameTextField.text = ""
        }
        if thirdNameTextField.text != "" {
            name3 = thirdNameTextField.text!
        } else {
            thirdNameTextField.text = ""
        }
        if hourRateTextField.text != "" {
            money1 = hourRateTextField.text!
        } else {
            hourRateTextField.text = ""
        }
        dismiss(animated: true, completion: nil)
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if name1 == "" {
            nameTextField.text = ""
        } else {
            nameTextField.text = name1
        }
        if name2 == "" {
            surnameTextField.text = ""
        } else {
            surnameTextField.text = name1
        }
        if name3 == "" {
            thirdNameTextField.text = ""
        } else {
            thirdNameTextField.text = name1
        }
        if money1 == "" {
            hourRateTextField.text = ""
        } else {
            hourRateTextField.text = name1
        }
        }
    
  
    
    }


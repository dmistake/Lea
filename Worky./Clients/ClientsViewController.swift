//
//  ClientsViewController.swift
//  Worky.
//
//  Created by Александр Головин on 02.02.2021.
//

import UIKit

class ClientsViewController: UIViewController {
    
    // Custom fields description
    @IBOutlet weak var clientName: UITextField!
    @IBOutlet weak var clientSecondName: UITextField!
    @IBOutlet weak var ClientThirdName: UITextField!
    
    @IBOutlet weak var OrganizationName: UITextField!
    @IBOutlet weak var NickName: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var Site: UITextField!
    
    @IBOutlet weak var MainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainView.layer.cornerRadius = 8
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(true)
        clientName.text = Client().name
        clientSecondName.text = Client().surname
        ClientThirdName.text = Client().thirdName
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesEnded(touches, with: event)
        self.view.endEditing(true)
    }
    
    
    
    
    @IBAction func SaveClientButton(_ sender: Any) {
        
        if let clientName = clientName.text {
            if let clientSecondName = clientSecondName.text {
                if let clientThirdName = ClientThirdName.text {
                    if let organizationName = OrganizationName.text {
                        if let nickNaame = NickName.text {
                            if let phone = Phone.text {
                                if let email = Email.text {
                                    if let address = Address.text {
                                        if let site = Site.text {
                                            ClientData.shared.AddClient(name: clientName, surname: clientSecondName, thirdName: clientThirdName, organizationName: organizationName, nickName: nickNaame, phone: phone, email: email, address: address, site: site)
                                        }
                                    }
                                }
                            }
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



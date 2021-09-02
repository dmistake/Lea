//
//  MainMOBEScreen.swift
//  Worky.
//
//  Created by Александр Головин on 17.03.2021.
//

import UIKit

class MainMOBEScreen: UIViewController {
    
    @IBOutlet weak var firstView: UIButton!
    @IBOutlet weak var secondView: UIButton!
    @IBOutlet weak var thirdView: UIButton!
    @IBOutlet weak var torthView: UIButton!
    
    let corner: CGFloat = 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Продукция"
        firstView.layer.cornerRadius = corner
        secondView.layer.cornerRadius = corner
        thirdView.layer.cornerRadius = corner
        torthView.layer.cornerRadius = corner
        
    }
    
}

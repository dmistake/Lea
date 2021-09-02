//
//  OrdersTableViewCell.swift
//  Worky.
//
//  Created by Александр Головин on 12.04.2021.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var ClientName: UILabel!
    @IBOutlet weak var OrderLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var DocLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

//
//  CompletedTableViewCell.swift
//  Worky.
//
//  Created by Александр Головин on 13.04.2021.
//

import UIKit

class CompletedTableViewCell: UITableViewCell {

    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var ClientLabel: UILabel!
    @IBOutlet weak var OrderLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var DocLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

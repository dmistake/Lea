//
//  ManagmentTableViewCell.swift
//  Worky.
//
//  Created by Александр Головин on 02.02.2021.
//

import UIKit

class ManagmentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

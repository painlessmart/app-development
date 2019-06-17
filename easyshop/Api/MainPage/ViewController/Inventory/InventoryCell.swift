//
//  InventoryCell.swift
//  easyshop
//
//  Created by Ali Ghanavati on 3/28/1398 AP.
//  Copyright © 1398 AP Ali Ghanavati. All rights reserved.
//

import UIKit

class InventoryCell: UITableViewCell {

    @IBOutlet weak var txtSerial: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var txtTitle: UILabel!
    @IBOutlet weak var txtActive: UILabel!
    @IBOutlet weak var txtInStock: UILabel!
    @IBOutlet weak var txtCount: UILabel!
    @IBOutlet weak var txtPrice: UILabel!
    @IBOutlet weak var imgLogoMarket: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

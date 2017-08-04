//
//  ItemCell.swift
//  Shopping List
//
//  Created by XinyuMiao on 2017/4/3.
//  Copyright © 2017年 Xinyu Miao. All rights reserved.
//

import UIKit

protocol ItemCellDelegate {
    func buttonPressed(cell: UITableViewCell)
}

class ItemCell: UITableViewCell {
    
    var delegate: ItemCellDelegate?
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemQtyLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemPurchasedButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func itemPurchasedButtonAction(_ sender: Any) {
        self.delegate?.buttonPressed(cell: self)
    }

}

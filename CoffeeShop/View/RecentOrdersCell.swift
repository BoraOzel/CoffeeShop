//
//  RecentOrdersCell.swift
//  CoffeeShop
//
//  Created by Bora Özel on 25/4/25.
//

import UIKit

class RecentOrdersCell: UITableViewCell {
    
    
    @IBOutlet weak var recentImageView: UIImageView!
    @IBOutlet weak var recentCoffeeLabel: UILabel!
    @IBOutlet weak var recentCoffeeSize: UILabel!
    @IBOutlet weak var recentCoffeePrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

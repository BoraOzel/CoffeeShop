import UIKit

class CartCell: UITableViewCell {
    
    
    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var selectedCoffeeLabel: UILabel!
    @IBOutlet weak var selectedSizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}

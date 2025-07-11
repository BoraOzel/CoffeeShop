import UIKit
import SDWebImage

class CartCell: UITableViewCell {
   
    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var selectedSizeLabel: UILabel!
    @IBOutlet weak var selectedCoffeeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadCellData(model: CoffeeModel) {
        DispatchQueue.main.async {
            self.selectedCoffeeLabel.text = model.title
            self.selectedSizeLabel.text = "Medium"
            self.priceLabel.text = "\(model.price) $"
            if let modelImage = model.image{
                self.coffeeImageView.sd_setImage(with: URL(string: modelImage))
            }
        }
    }

}

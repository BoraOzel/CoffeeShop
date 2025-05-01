import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadCellData(model: CoffeeModel){
        nameLabel.text = model.title
        coffeeImageView.sd_setImage(with: URL(string: model.image!))
        priceLabel.text = "Price: \(model.price) $"
    }
    
}

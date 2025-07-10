import UIKit
import SDWebImage

protocol FavouriteCellDelegate: AnyObject {
    func cellRequestDelete(cell: FavCollectionViewCell)
}

class FavCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    weak var delegate: FavouriteCellDelegate?
    var view: AccountViewController?
    
    func loadCellData(model: CoffeeModel) {
        DispatchQueue.main.async {
            self.nameLabel.text = model.title
            self.imageView.sd_setImage(with: URL(string: model.image!))
        }
    }
    
    @IBAction func favButtonClicked(_ sender: Any) {
        delegate?.cellRequestDelete(cell: self)
    }
    
}

import UIKit
import SDWebImage

protocol AddToFavouriteDelegate: AnyObject {
    func reloadCoffeeData()
}

class CoffeeDetailViewController: UIViewController {
    
    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var mediumPriceLabel: UILabel!
    @IBOutlet weak var coffeeDescriptionLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    var selectedIndex = Int()
    var menuViewModel: MenuViewModel!
    var accountViewModel: AccountViewModel!
    var cartViewModel: CartViewModel!
    var coffee: CoffeeModel!
    weak var favDelegate: AddToFavouriteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffeeImageView.sd_setImage(with: URL(string: menuViewModel.selectedCoffee[selectedIndex].image!))
        coffeeNameLabel.text = menuViewModel.selectedCoffee[selectedIndex].title
        mediumPriceLabel.text = "\(menuViewModel.selectedCoffee[selectedIndex].price) $"
        coffeeDescriptionLabel.text = menuViewModel.selectedCoffee[selectedIndex].description
        
    }
    
    @IBAction func favButtonClicked(_ sender: Any) {
        updateFav()
        favDelegate?.reloadCoffeeData()
    }
    
    
    @IBAction func addToCartClicked(_ sender: Any) {
        cartViewModel.addToCart(coffee: menuViewModel.selectedCoffee[selectedIndex])
        AlertHelper.showAlert(on: self, title: "Cart", message: "Item added to cart.")
    }
    
   func updateFav() {
        coffee = menuViewModel.selectedCoffee[selectedIndex]
        
        UserDefaultsService.updateWith(favourite: coffee, actionType: .add) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else {
                DispatchQueue.main.async {
                    AlertHelper.showAlert(on: self, title: "Success!", message: "You've succesfully favourited this coffee!")
                    self.favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                }
                return
            }
            AlertHelper.showAlert(on: self, title: "Error!", message: error.rawValue)
        }
    }
}

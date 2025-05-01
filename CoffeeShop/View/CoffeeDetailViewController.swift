import UIKit
import SDWebImage

class CoffeeDetailViewController: UIViewController {

    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var mediumPriceLabel: UILabel!
    @IBOutlet weak var coffeeDescriptionLabel: UILabel!
    
    var chosenCoffee = CoffeeViewModel().chosenCoffee
    var chosenIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        coffeeImageView.sd_setImage(with: URL(string: chosenCoffee[chosenIndex].image!))
        coffeeNameLabel.text = chosenCoffee[chosenIndex].title
        mediumPriceLabel.text = "\(chosenCoffee[chosenIndex].price) $"
        coffeeDescriptionLabel.text = chosenCoffee[chosenIndex].description
    }
   
   

    @IBAction func addToCartClicked(_ sender: Any) {
        CartViewModel.shared.addToCart(coffee: chosenCoffee[chosenIndex])
    }
    
}
    
    
    


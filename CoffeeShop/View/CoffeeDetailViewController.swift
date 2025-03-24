import UIKit

class CoffeeDetailViewController: UIViewController {

    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var coffeeNameLabel: UILabel!
    @IBOutlet weak var smallPriceLabel: UILabel!
    @IBOutlet weak var mediumPriceLabel: UILabel!
    @IBOutlet weak var largePriceLabel: UILabel!
    
    
    var chosenCoffee = CoffeeViewModel().chosenCoffee
    var chosenIndex = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let smallPrice = chosenCoffee[chosenIndex].price
        let mediumPrice = chosenCoffee[chosenIndex].price * 1.2
        let largePrice = chosenCoffee[chosenIndex].price * 1.4
        
        let roundedMedium = (mediumPrice * 10).rounded() / 10
        let roundedLarge = (largePrice * 10).rounded() / 10
        
        coffeeImageView.image = UIImage(named: chosenCoffee[chosenIndex].imageName)
        coffeeNameLabel.text = chosenCoffee[chosenIndex].name
        smallPriceLabel.text = "\(smallPrice) ₺"
        mediumPriceLabel.text = "\(roundedMedium) ₺"
        largePriceLabel.text = "\(roundedLarge) ₺"
    }
    

    @IBAction func smallButtonClicked(_ sender: Any) {
        
        chosenCoffee[chosenIndex].size = .small
        CartViewModel.shared.addToCart(coffee: chosenCoffee[chosenIndex])
        
    }
    
    
    @IBAction func mediumButtonClicked(_ sender: Any) {
        
        chosenCoffee[chosenIndex].size = .medium
        chosenCoffee[chosenIndex].price = chosenCoffee[chosenIndex].basePrice * 1.2
        CartViewModel.shared.addToCart(coffee: chosenCoffee[chosenIndex])
        
    }
    
    @IBAction func largeButtonClicked(_ sender: Any) {
    
        chosenCoffee[chosenIndex].size = .large
        chosenCoffee[chosenIndex].price = chosenCoffee[chosenIndex].basePrice * 1.4
        CartViewModel.shared.addToCart(coffee: chosenCoffee[chosenIndex])
        
    }
    

        
}
    
    
    


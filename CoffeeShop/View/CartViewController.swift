import UIKit
import SDWebImage

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.rowHeight = 87
        totalLabel.text = "Total: \(CartViewModel.shared.totalPrice) $"
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTotalPriceLabel), name: NSNotification.Name("updateTotalPrice"), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartTableView.reloadData()
    }
    
    
    @IBAction func orderButtonClicked(_ sender: Any) {
        AccountViewModel.shared.recentOrders.append(contentsOf: CartViewModel.shared.cartItems)
        CartViewModel.shared.deleteCart()
        cartTableView.reloadData()
        
        AlertHelper.showAlert(on: self, title: "Order", message: "Ordered successfully.")
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CartViewModel.shared.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        let cartCoffee =  CartViewModel.shared.cartItems[indexPath.row]
        cell.coffeeImageView.sd_setImage(with: URL(string: cartCoffee.image!))
        cell.priceLabel.text = "\(cartCoffee.price) $"
        cell.selectedCoffeeLabel.text = cartCoffee.title
        cell.selectedSizeLabel.text = "Medium"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            CartViewModel.shared.deleteItem(IndexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
            totalLabel.text = "Total: \(CartViewModel.shared.totalPrice) $"
        }
    }
    
    @objc func updateTotalPriceLabel(){
        totalLabel.text = "Total: \(CartViewModel.shared.totalPrice) $"
    }
    
}




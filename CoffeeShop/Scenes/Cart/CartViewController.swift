import UIKit
import SDWebImage

protocol CartViewControllerInterface {
    func configureVC()
}

class CartViewController: UIViewController {

    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    
    var viewModel: CartViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartTableView.reloadData()
        print(viewModel.cartItems.count)
    }
    
    @IBAction func orderButtonClicked(_ sender: Any) {        
        AlertHelper.showAlert(on: self, title: "Order", message: "Ordered successfully.")
        viewModel.deleteCart()
        cartTableView.reloadData()
    }

}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        cell.loadCellData(model: viewModel.cartItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            viewModel.deleteItem(IndexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
            totalLabel.text = "Total: \(viewModel.totalPrice) $"
        }
    }
}

extension CartViewController: CartViewControllerInterface {
    func configureVC() {
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.rowHeight = 87
        totalLabel.text = "Total: \(viewModel.totalPrice) $"
        NotificationCenter.default.addObserver(self, selector: #selector(updateTotalPriceLabel), name: NSNotification.Name("updateTotalPrice"), object: nil)
    }
    
    @objc func updateTotalPriceLabel(){
        totalLabel.text = "Total: \(viewModel.totalPrice) $"
    }
}

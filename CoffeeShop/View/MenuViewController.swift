import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var selectedCoffee = CoffeeViewModel().selectedCoffee
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 87
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoffeeViewModel().coffees.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuCell
        let coffee = CoffeeViewModel().coffees[indexPath.row]
        cell.coffeeImageView.image = UIImage(named: coffee.imageName)
        cell.nameLabel.text = coffee.name
        cell.priceLabel.text = "\(String(coffee.basePrice)) TRY"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let coffee = CoffeeViewModel().coffees[indexPath.row]
        selectedCoffee.append(coffee)
        performSegue(withIdentifier: "toCoffeeDetailViewController", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toCoffeeDetailViewController"{
            
            let destinationVC = segue.destination as! CoffeeDetailViewController
            destinationVC.chosenCoffee.append(contentsOf: selectedCoffee)
            destinationVC.chosenIndex = selectedCoffee.count - 1
        }
        
    }
    
    

}

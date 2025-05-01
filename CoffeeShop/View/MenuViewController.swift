import UIKit
import SDWebImage

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = CoffeeViewModel()
    var selectedCoffee = CoffeeViewModel().coffees
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 87

        loadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coffees.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuCell
        cell.loadCellData(model: viewModel.coffees[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coffee = viewModel.coffees[indexPath.row]
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
    
    func loadData(){
        viewModel.getCoffees {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

import UIKit
import FirebaseAuth
import SDWebImage

class AccountViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var ordersTableView: UITableView!
    
    
    let authService = AuthService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailLabel.text = Auth.auth().currentUser?.email
        
        ordersTableView.delegate = self
        ordersTableView.dataSource = self
        ordersTableView.rowHeight = 87
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        ordersTableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AccountViewModel.shared.recentOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecentOrdersCell", for: indexPath) as! RecentOrdersCell
        let recentItem = AccountViewModel.shared.recentOrders.reversed()[indexPath.row]
        cell.recentImageView.sd_setImage(with: URL(string: recentItem.image!))
        cell.recentCoffeeSize.text = "Medium"
        cell.recentCoffeeLabel.text = recentItem.title
        cell.recentCoffeePrice.text = String(recentItem.price)
        
        return cell
    }
    

    
    
    @IBAction func signOutClicked(_ sender: Any) {
     
        authService.signOut {result in
            
            DispatchQueue.main.async {
                
                switch result{
                case .success(_):
                    self.performSegue(withIdentifier: "toViewController", sender: nil)
                case .failure(let error):
                    AlertHelper.showAlert(on: self, title: "Error!", message: error.localizedDescription)
                }
                
            }
            
        }
     
    }
    
    
    
    

}

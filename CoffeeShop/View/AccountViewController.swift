import UIKit
import FirebaseAuth

class AccountViewController: UIViewController {

    
    @IBOutlet weak var emailLabel: UILabel!
    
    let authService = AuthService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailLabel.text = Auth.auth().currentUser?.email
        
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

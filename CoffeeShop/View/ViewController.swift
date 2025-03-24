import UIKit
import FirebaseAuth


class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    let authService = AuthService()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != ""{
            
            authService.signIn(email: emailText.text!, password: passwordText.text!) {result in
                
                DispatchQueue.main.async {
                    
                    switch result{
                    case .success(_):
                        self.performSegue(withIdentifier: "toMenuVC", sender: nil)
                    case .failure(let error):
                        AlertHelper.showAlert(on: self, title: "Error!", message: error.localizedDescription)
                    }
                }
            }
        }
        else{
            AlertHelper.showAlert(on: self, title: "Error!", message: "Email or password can not be empty.")
        }
        
        
    }
    
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != ""{
            
            authService.signUp(email: emailText.text!, password: passwordText.text!) {result in
                
                DispatchQueue.main.async {
                    
                    switch result{
                    case .success(_):
                        self.performSegue(withIdentifier: "toMenuVC", sender: nil)
                    case .failure(let error):
                        AlertHelper.showAlert(on: self, title: "Error!", message: error.localizedDescription)
                    }
                }
            }
        }
        else{
            AlertHelper.showAlert(on: self, title: "Error!", message: "Email or password can not be empty.")
        }
        
    }
    
    

}


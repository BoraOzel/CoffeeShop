import Foundation
import UIKit

class AlertHelper {
    static func showAlert(on viewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        viewController.present(alert, animated: true, completion: nil)
    }
}
    

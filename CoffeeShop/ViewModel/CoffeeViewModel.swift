import Foundation
import UIKit

class CoffeeViewModel{
    
    var coffees = [CoffeeModel]()
    
    var chosenCoffee = [CoffeeModel]()
    var selectedCoffee : [CoffeeModel] = []
    var cartItem = [CoffeeModel]()

    
    func getCoffees(completion:@escaping () -> Void){
 
        let urlString = "https://api.sampleapis.com/coffee/hot"
        ApiService.fetchData(urlString: urlString) { coffees, error in
            
            if let coffees{
                self.coffees = coffees
                completion()
            }
            
        }
        
    }


}

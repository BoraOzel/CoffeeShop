import Foundation
import UIKit

class CoffeeViewModel {
    
    var coffees = [CoffeeModel]()
    var chosenCoffee = [CoffeeModel]()
    var selectedCoffee : [CoffeeModel] = []
    
    func getCoffees() async {
        let url = "https://api.sampleapis.com/coffee/iced"
        do{
            let coffees = try await ApiService.shared.fetchData(url: url)
            if let coffees = coffees {
                DispatchQueue.main.async {
                    self.coffees = coffees
                }
            }
        }
        catch{
            print("error")
        }
    }
}

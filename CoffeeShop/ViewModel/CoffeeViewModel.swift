import Foundation
import UIKit

class CoffeeViewModel{
  
    var chosenCoffee = [Coffee]()
    var selectedCoffee : [Coffee] = []
    var cartItem = [Coffee]()
    
    var coffees : [Coffee] = [
        Coffee(name: "Espresso", basePrice: 80.0, price: 80.0, size: CoffeeSize.small , imageName: "espresso"),
        Coffee(name: "Americano", basePrice: 90.0, price: 90.0, size: CoffeeSize.small, imageName: "americano"),
        Coffee(name: "Filter Coffee", basePrice: 90.0, price: 90.0, size: CoffeeSize.small, imageName: "filter-coffee"),
        Coffee(name: "Latte", basePrice: 100.0, price: 100.0, size: CoffeeSize.small, imageName: "latte"),
        Coffee(name: "Turkish Coffee", basePrice: 90.0, price: 90.0, size: CoffeeSize.small, imageName: "turkish-coffee"),
        Coffee(name: "Cappucino", basePrice: 100.0, price: 100.0, size: CoffeeSize.small, imageName: "cappucino"),
        Coffee(name: "Tea", basePrice: 70.0, price: 70.0, size: CoffeeSize.small, imageName: "tea"),
        Coffee(name: "Matcha Tea", basePrice: 110.0, price: 110.0, size: CoffeeSize.small, imageName: "matcha-tea"),
        Coffee(name: "Mocha", basePrice: 120.0, price: 120.0, size: CoffeeSize.small, imageName: "mocha"),
        Coffee(name: "Bubble Tea", basePrice: 110.0, price: 110.0, size: CoffeeSize.small, imageName: "bubble-tea"),
        Coffee(name: "Frappe", basePrice: 120.0, price: 120.0, size: CoffeeSize.small, imageName: "frappe"),
        Coffee(name: "Milkshake", basePrice: 120.0, price: 120.0, size: CoffeeSize.small, imageName: "milkshake"),
        Coffee(name: "Iced Americano", basePrice: 100.0, price: 100.0, size: CoffeeSize.small, imageName: "iced-americano"),
        Coffee(name: "Iced Latte", basePrice: 110.0, price: 110.0, size: CoffeeSize.small, imageName: "iced-latte"),
        Coffee(name: "Iced Matcha", basePrice: 120.0, price: 120.0, size: CoffeeSize.small, imageName: "iced-matcha"),
    ]


}

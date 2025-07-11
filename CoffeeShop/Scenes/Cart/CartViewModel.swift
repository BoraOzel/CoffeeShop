import Foundation

protocol CartViewModelInterface {
    var view: CartViewControllerInterface? { get set }
    func viewDidLoad()
    func addToCart(coffee: CoffeeModel)
    func updateTotalPrice()
    func deleteItem(IndexPath: IndexPath)
    func deleteCart()
}

class CartViewModel{
    var view: CartViewControllerInterface?
    var cartItems = [CoffeeModel]()
    var totalPrice = Double()
}

extension CartViewModel: CartViewModelInterface {
    
    func viewDidLoad() {
        view?.configureVC()
    }
    
    func addToCart(coffee: CoffeeModel){
        cartItems.append(coffee)
        updateTotalPrice()
    }
    
    func updateTotalPrice(){
        totalPrice = 0
        for item in cartItems {
            totalPrice = totalPrice + item.price
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("updateTotalPrice"), object: nil)
    }
    
    func deleteItem(IndexPath: IndexPath){
        if IndexPath.row >= 0 && IndexPath.row <= cartItems.count{
            cartItems.remove(at: IndexPath.row)
            updateTotalPrice()
        }
    }
    
    func deleteCart(){
        cartItems.removeAll()
        updateTotalPrice()
    }
}

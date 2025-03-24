import Foundation
import UIKit

class CartViewModel{

    static let shared = CartViewModel()

    private init() {}
    
    var cartItems: [Coffee] = []
    var totalPrice = Double()
    
    func addToCart(coffee: Coffee){
        
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

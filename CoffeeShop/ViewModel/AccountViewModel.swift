import Foundation

class AccountViewModel{
    
    static let shared = AccountViewModel()
    
    private init() {}
    
    var recentOrders : [CoffeeModel] = []
}

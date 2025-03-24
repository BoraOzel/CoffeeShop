import Foundation

enum CoffeeSize : String{
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}


struct Coffee{
    
    var name : String
    var basePrice: Double
    var price: Double
    var size : CoffeeSize
    var imageName : String
    
    init(name: String, basePrice: Double, price: Double, size: CoffeeSize, imageName: String) {
        self.name = name
        self.basePrice = basePrice
        self.price = basePrice
        self.size = size
        self.imageName = imageName
    }
    
    
}

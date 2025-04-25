import Foundation
import UIKit

struct Coffees : Codable{
    
    let coffees : [CoffeeModel]
    
}


struct CoffeeModel : Codable {
     
    let id : Int?
    let title : String?
    let price : Double
    let description : String?
    let image : String?
    
}


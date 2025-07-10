import Foundation

struct Coffees : Codable, Equatable {
    let coffees : [CoffeeModel]
}


struct CoffeeModel : Codable, Equatable {
    let id : Int?
    let title : String?
    let price = 5.0
    let description : String?
    let image : String?
}


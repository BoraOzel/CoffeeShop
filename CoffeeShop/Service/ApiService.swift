import Foundation

class ApiService{

    static let shared = ApiService() 
    private init() {}
    
    func fetchData(url: String) async throws -> [CoffeeModel]? {
        
        guard let url = URL(string: url) else { return nil }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let coffees = try? JSONDecoder().decode([CoffeeModel].self, from: data)
        return coffees
    }

}

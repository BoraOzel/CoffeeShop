
import Foundation

enum UDActionType {
    case add, remove
}

enum UserDefaultsService {
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favourites = "favourites"
    }
    
    static func updateWith(favourite: CoffeeModel, actionType: UDActionType, completion: @escaping (FavouriteError?) -> ()) {
        getFavourites { result in
            switch result{
            case .success(var favourites):
                switch actionType{
                case .add:
                    guard !favourites.contains(favourite) else {
                        completion(.alreadyInFavourites)
                        return
                    }
                    favourites.append(favourite)
                case .remove:
                    favourites.removeAll { $0.id == favourite.id }
                }
                completion(save(favourites: favourites))
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    static func getFavourites(completion: @escaping (Result <[CoffeeModel], FavouriteError>) -> ()) {
        
        guard let favData = defaults.object(forKey: Keys.favourites) as? Data else {
            completion(.success([]))
            return
        }
        
        do{
            let decoder = JSONDecoder()
            let favourites = try decoder.decode([CoffeeModel].self, from: favData)
            completion(.success(favourites))
        } catch {
            completion(.failure(.unableToFavourite))
        }
    }
    
    static private func save(favourites: [CoffeeModel]) -> FavouriteError? {
        do{
            let encoder = JSONEncoder()
            let encodedFavourites = try encoder.encode(favourites)
            defaults.setValue(encodedFavourites, forKey: Keys.favourites)
            return nil
        } catch {
            return .unableToFavourite
        }
    }
}

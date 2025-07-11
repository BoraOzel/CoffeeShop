import Foundation
import UIKit

protocol AccountViewModelInterface {
    var view: AccountViewControllerInterface? { get set }
    func viewDidLoad()
    func viewWillAppear()
    func getFavourites()
    func handleFavourites(with favourites: [CoffeeModel])
    func deleteCell(indexPath: IndexPath)
}

class AccountViewModel{
    var favCoffees = [CoffeeModel]()
    var view: AccountViewControllerInterface?
}

extension AccountViewModel: AccountViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
    }
    
    func viewWillAppear() {
        getFavourites()
    }
    
    func getFavourites() {
        UserDefaultsService.getFavourites { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let favourites):
                self.handleFavourites(with: favourites)
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func handleFavourites(with favourites: [CoffeeModel]) {
        self.favCoffees = favourites
        self.view?.reloadCollectionViewOnMainThread()
    }
    
    func deleteCell(indexPath: IndexPath) {
        guard indexPath.row <= favCoffees.count else { return }
        
        UserDefaultsService.updateWith(favourite: favCoffees[indexPath.row], actionType: .remove) { [weak self] error in
            guard let self = self else { return }
            guard let error = error else {
                self.favCoffees.remove(at: indexPath.row)
                view?.deleteFavoritedItem(at: indexPath)
                
                if self.favCoffees.isEmpty {
                    AlertHelper.showAlert(on: self.view as! UIViewController, title: "No Favourites!", message: "You can favourite coffees on the coffee details screen.")
                }
                return
            }
            AlertHelper.showAlert(on: self.view as! UIViewController, title: "Error", message: error.localizedDescription)
        }
    }
}

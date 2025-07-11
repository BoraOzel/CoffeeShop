import UIKit
import FirebaseAuth
import SDWebImage

protocol AccountViewControllerInterface: AnyObject {
    func configureVC()
    func reloadCollectionViewOnMainThread()
    func deleteFavoritedItem(at indexPath: IndexPath)
}

class AccountViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var accountCollectionView: UICollectionView!
    
    let authService = AuthService()

    var viewModel: AccountViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.viewWillAppear()
    }
    
    
    @IBAction func signOutClicked(_ sender: Any) {
        authService.signOut {result in
            DispatchQueue.main.async {
                switch result{
                case .success(_):
                    self.performSegue(withIdentifier: "toViewController", sender: nil)
                case .failure(let error):
                    AlertHelper.showAlert(on: self, title: "Error!", message: error.localizedDescription)
                }
            }
        }
    }
}

extension AccountViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.favCoffees.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouriteCell", for: indexPath) as! FavCollectionViewCell
        cell.delegate = self
        cell.loadCellData(model: viewModel.favCoffees[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 16
        let itemsPerRow: CGFloat = 2
        
        let totalPadding = (itemsPerRow + 1) * padding
        let itemWidth = (collectionView.bounds.width - totalPadding) / itemsPerRow
        
        return CGSize(width: itemWidth, height: itemWidth * 1.4)
    }
    
}

extension AccountViewController: AccountViewControllerInterface {
    func configureVC() {
        accountCollectionView.delegate = self
        accountCollectionView.dataSource = self
        emailLabel.text = Auth.auth().currentUser?.email
    }
    
    func reloadCollectionViewOnMainThread() {
        DispatchQueue.main.async {
            self.accountCollectionView.reloadData()
        }
    }
    
    func deleteFavoritedItem(at indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.accountCollectionView.deleteItems(at: [indexPath])
        }
    }
}

extension AccountViewController: FavouriteCellDelegate {
    func cellRequestDelete(cell: FavCollectionViewCell) {
        guard let indexPath = accountCollectionView.indexPath(for: cell) else { return }
        self.viewModel.deleteCell(indexPath: indexPath)
    }
}

extension AccountViewController: AddToFavouriteDelegate {
    func reloadCoffeeData() {
        self.accountCollectionView.reloadData()
    }
}


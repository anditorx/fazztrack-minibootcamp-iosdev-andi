
import UIKit

class RestaurantListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: RestaurantsViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
    }
    

}

extension RestaurantListViewController {
    func setup() {
        tableView.dataSource = self;
        tableView.delegate = self;
        viewModel = RestaurantsViewModel(delegate: self)

    }
}

// MARK: - RestaurantListViewModelDelegate
extension RestaurantListViewController: RestaurantViewModelDelegate {
    func restaurantsDidUpdate() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension RestaurantListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRestaurants
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCellId", for: indexPath) as! RestaurantViewCell
        let index = indexPath.row
//
        cell.thumbImageView.image = viewModel.restaurantThumb(at: index)
        cell.nameLabel.text = viewModel.restaurantName(at: index)
        cell.addressLabel.text = viewModel.restaurantAddress(at: index)
        cell.categoryLabel.text = viewModel.restaurantCategory(at: index)
        
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension RestaurantListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell : \(viewModel.restaurantName(at: indexPath.row))")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Restaurant", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RestaurantDetail") as! RestaurantDetailViewController
        let index = indexPath.row
        
        viewController.index = index
        viewController.thumbnails = viewModel.restaurantThumb(at: index)
        viewController.name = viewModel.restaurantName(at: index)
        viewController.desc = viewModel.restaurantDescription(at: index)
        viewController.category = viewModel.restaurantCategory(at: index)
        viewController.phone = viewModel.restaurantPhone(at: index)
        viewController.address = viewModel.restaurantAddress(at: index)
        viewController.latitude = viewModel.restaurantLatitude(at: index)
        viewController.longitude = viewModel.restaurantLongitude(at: index)
        
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}




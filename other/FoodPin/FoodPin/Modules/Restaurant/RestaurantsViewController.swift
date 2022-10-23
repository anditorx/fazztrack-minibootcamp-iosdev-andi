//
//  RestaurantsViewController.swift
//  FoodPin
//
//  Created by Bayu Yasaputro on 22/10/22.
//

import UIKit

class RestaurantsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: RestaurantsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
}

// MARK: - Helpers
extension RestaurantsViewController {
    func setup() {
        viewModel = RestaurantsViewModel(delegate: self)
        tableView.register(UINib(nibName: "RestaurantViewCell", bundle: nil), forCellReuseIdentifier: RestaurantViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func addRestaurant() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nv = storyboard.instantiateViewController(withIdentifier: "navNewRestaurant") as! UINavigationController
        let vc = nv.viewControllers.first as! NewRestaurantViewController
        
        vc.completion = { (image, name, type, address, phone, desc) in
            self.viewModel.addRestaurant(name: name, category: type, address: address, phone: phone, description: desc, thumb: image)
        }
        
        present(nv, animated: true)
    }
    
    func rateRestaurant(at index: Int) {
        let thumb = viewModel.restaurantThumb(at: index)
        presentReviewViewController(backgroundImage: thumb) { (rating) in
            self.viewModel.rateRestaurant(at: index, rating: rating)
        }
    }
}

// MARK: - Actions
extension RestaurantsViewController {
    @IBAction func addButtonTapped(_ sender: Any) {
        addRestaurant()
    }
}

// MARK: - RestaurantViewModelDelegate
extension RestaurantsViewController: RestaurantViewModelDelegate {
    func restaurantsDidUpdate() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension RestaurantsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRestaurants
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RestaurantViewCell.identifier, for: indexPath) as! RestaurantViewCell
        
        let index = indexPath.row
        cell.thumbImageView.image = viewModel.restaurantThumb(at: index)
        cell.ratingImageView.image = viewModel.restaurantRating(at: index)?.image
        cell.nameLabel.text = viewModel.restaurantName(at: index)
        cell.addressLabel.text = viewModel.restaurantAddress(at: index)
        cell.categoryLabel.text = viewModel.restaurantCategory(at: index)
        
        cell.topConstraint.constant = index == 0 ? 20 : 10
        cell.bottomConstraint.constant = index == viewModel.numberOfRestaurants - 1 ? 20 : 10
        cell.setNeedsLayout()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        rateRestaurant(at: indexPath.row)
    }
}

//
//  CoffeeShopListViewController.swift
//  Tugas_TableView
//
//  Created by Armstrong on 17/09/22.
//

import UIKit

class CoffeeShopListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
   
    var coffeeshops: [CoffeeShop] = [
        CoffeeShop(name: "Egg Benedict", thumbnails: "egg_benedict.jpg", prepTime: "1 hour"),
        CoffeeShop(name: "Mushroom Risotto", thumbnails: "mushroom_risotto.jpg", prepTime: "30 min"),
        CoffeeShop(name: "Full Breakfast", thumbnails: "full_breakfast.jpg", prepTime: "25 min"),
        CoffeeShop(name: "Hamburger", thumbnails: "hamburger.jpg", prepTime: "15 min"),
        CoffeeShop(name: "Ham and Egg Sandwich", thumbnails: "ham_and_egg_sandwich.jpg", prepTime: "20 min"),
        CoffeeShop(name: "Creme Brelee", thumbnails: "creme_brelee.jpg", prepTime: "10 min"),
        CoffeeShop(name: "White Chocolate Donut", thumbnails: "white_chocolate_donut.jpg", prepTime: "1 hour"),
        CoffeeShop(name: "Starbucks Coffee", thumbnails: "starbucks_coffee.jpg", prepTime: "2 hour"),
        CoffeeShop(name: "Vegetable Curry", thumbnails:"vegetable_curry.jpg", prepTime: "50 min"),
        CoffeeShop(name: "Instant Noodle with Egg", thumbnails:"instant_noodle_with_egg.jpg", prepTime: "65 min"),
        CoffeeShop(name: "Noodle with BBQ", thumbnails:"vegetable_curry.jpg", prepTime: "40 min"),
        CoffeeShop(name: "Japanese Noodle", thumbnails:"vegetable_curry.jpg", prepTime: "30 min"),
        CoffeeShop(name: "Green Tea", thumbnails:"green_tea.jpg", prepTime: "25 min"),
        CoffeeShop(name: "Thai Shrimp Cake", thumbnails:"thai_shrimp_cake.jpg", prepTime: "1.5 hour"),
        CoffeeShop(name: "Angry Birds Cake", thumbnails:"angry_birds_cake.jpg", prepTime: "2 hour"),
        CoffeeShop(name: "Ham and Cheese Panini", thumbnails:"ham_and_cheese_panini.jpg", prepTime: "35 min")
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - UITableViewDataSource
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeshops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeShopCellId", for: indexPath) as! CoffeeShopViewCell
        
        let coffeeshop = coffeeshops[indexPath.row]
        
        if let thumbnails = coffeeshop.thumbnails{
            cell.thumbImageView.image = UIImage(named: thumbnails)
        }else{
            cell.thumbImageView.image = UIImage(systemName: "photo")
        }
        
        cell.nameLabel.text = coffeeshop.name// set name
        cell.categoryLabel.text = "Prep Time: \(coffeeshop.prepTime!)" // set category
        
        // MARK: - HANDLE FAVORITE COFFEESHOP
        // check item cel mana aja yang ada di array favoritedCoffeeShop
        
        return cell
    }
    
    
    //MARK: - Helper Function
    func reserveTable(_ index: Int){
        let alert = UIAlertController(title: "Not available", message: "Sorry, this feature is not available yet.\nPlease try again later.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        // Show alert
        present(alert, animated: true)
    }
    
    func toogleFavorite(_ index: Int){
        print(index)
        // lakukan reload sesuai row yang di pilih saja
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: UITableView.RowAnimation.automatic)
    }
    
    func handleShare(at indexpath: IndexPath) {
        let coffeeshop = coffeeshops[indexpath.row]
        let name = coffeeshop.name ?? ""
        let url = URL(string: "https://github.com/anditorx")!
        var image: UIImage
        
        if let imageName = coffeeshop.thumbnails{
            image = UIImage(named: imageName) ?? UIImage(systemName: "photo")!
        } else{
          image = UIImage(systemName: "photo")!
        }
    
        let viewController = UIActivityViewController(activityItems: [name, image, url], applicationActivities: nil)
        viewController.popoverPresentationController?.sourceView = view
        present(viewController, animated: true)
    }
    
    func delete(at indexPath: IndexPath) {
        coffeeshops.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
    
    //MARK: - UITableViewSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Setelah di select rownya, kita deselect lagi agar highlightnya hilang kembali.
        // Tujuannua agar lebih terlihat ada effect touchablenya
        print("path \(coffeeshops[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "CoffeeShop", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "CoffeeShopDetail") as! CoffeeShopDetailViewController
        
        viewController.data = coffeeshops[indexPath.row]
        viewController.name = coffeeshops[indexPath.row].name
        viewController.thumbnails = coffeeshops[indexPath.row].thumbnails
        viewController.prepTime = coffeeshops[indexPath.row].prepTime
        
        
        navigationController?.pushViewController(viewController, animated: true)
       
    }
    
    
    // MARK: SLIDE
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // swipe share
        let share = UIContextualAction(style: .normal, title: "Share"){ action, view, completion in
            self.handleShare(at: indexPath)
        }
        share.image = UIImage(systemName: "square.and.arrow.up") // menambahkan image icon share
        share.backgroundColor = UIColor.systemTeal // menambahkan background color
        
        // swipe delete
        let delete = UIContextualAction(style: .destructive, title: "Delete"){ action, view, completion in
            print("Delete")
            
            self.delete(at: indexPath)
            completion(true)
        }
        delete.image = UIImage(systemName: "trash") // menambahkan image icon delete
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [delete,share])
        swipeConfiguration.performsFirstActionWithFullSwipe = false
        return swipeConfiguration
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var favoriteString = "Like"
        
        
        
        let like = UIContextualAction(style: .normal, title: favoriteString){ action, view, completion in
            print("like = \(indexPath.row)")
            self.toogleFavorite(indexPath.row)
            completion(true)
            
        }
        like.image = UIImage(systemName: "star.fill") // menambahkan image icon like
        like.backgroundColor = UIColor.systemYellow
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [like])
        return swipeConfiguration
    }
    
}

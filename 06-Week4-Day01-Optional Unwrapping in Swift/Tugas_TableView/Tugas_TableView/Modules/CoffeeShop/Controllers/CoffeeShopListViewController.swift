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
        CoffeeShop(name: "Boja Eatery", type: "Coffeeshop / Cafe", location: "Jl. Pungkur", image: nil, isFavorite: false),
            
        CoffeeShop(name: "Brewery Coffee", type: "Tea House", location: "Jl. Buahbatu", image: "brewery", isFavorite: false),
            
        CoffeeShop(name: "Casadela Coffee", type: "Cafe Shop", location: "Jl. Asia Afrika", image: "casadela", isFavorite: false),
            
        CoffeeShop(name: "Dago Terrace", type: "Home Coffee", location: "Jl. Sudirman", image: "dagoterrace", isFavorite: false),
            
        CoffeeShop(name: "Hola Koffie", type: "Coffeeshop / Cafe", location: "Jl. Setiabudi", image: "holakoffie", isFavorite: false),
            
        CoffeeShop(name: "Imah Kai", type: "Tea House", location: "Jl. Boscha", image: "imahkai", isFavorite: false),
            
        CoffeeShop(name: "Jiwan Kopi", type: "Cafe", location: "Jl. Sukabumi", image: "jiwan", isFavorite: false),
            
        CoffeeShop(name: "Kilogram Space", type: "Home Coffee", location: "Jl. Soekarno Hatta", image: "kilogram", isFavorite: false),
            
        CoffeeShop(name: "Masagi Coffee", type: "Bakery / Cafe", location: "Jl. Kopo", image: "masagi", isFavorite: false),
            
        CoffeeShop(name: "Nannys Pavillion", type: "Tea House / Cafe", location: "Jl. Dago", image: "nannys", isFavorite: false),
            
        CoffeeShop(name: "Sabana Kopi", type: "Coffeeshop / Bakery", location: "Jl. Cibiru", image: "sabanakopi", isFavorite: false),
            
        CoffeeShop(name: "Sini Kupi", type: "Coffeeshop / Milk House", location: "Jl. Aceh", image: "sinikupi", isFavorite: false),
            
        CoffeeShop(name: "Sonowae Kopi", type: "Coffeeshop / Cafe", location: "Jl. Cihapit", image: "sonowae", isFavorite: false),
            
        CoffeeShop(name: "Starbuck Coffee", type: "Bakery", location: "Jl. Gandapura", image: "starbuck", isFavorite: false),
            
        CoffeeShop(name: "Urra Cafe", type: "Warmindo", location: "Jl. Riau", image: "urracafe", isFavorite: false)

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
        
        if let image = coffeeshop.image{
            cell.thumbImageView.image = UIImage(named: image)
        }else{
            cell.thumbImageView.image = UIImage(systemName: "photo")
        }
        
        cell.nameLabel.text = coffeeshop.name// set name
        cell.addressLabel.text = coffeeshop.location // set address
        cell.categoryLabel.text = coffeeshop.type // set category
        
        // MARK: - HANDLE FAVORITE COFFEESHOP
        // check item cel mana aja yang ada di array favoritedCoffeeShop
        if coffeeshop.isFavorite {
            cell.imgLove.image = UIImage(named: "heart") // set favorite
        }else{
            cell.imgLove.image = UIImage(named: "")
        }
        
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
        if coffeeshops[index].isFavorite {
            coffeeshops[index].isFavorite = false
        }else{
            coffeeshops[index].isFavorite = true
        }
        
        // lakukan reload sesuai row yang di pilih saja
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: UITableView.RowAnimation.automatic)
    }
    
    func handleShare(at indexpath: IndexPath) {
        let coffeeshop = coffeeshops[indexpath.row]
        let name = coffeeshop.name ?? ""
        let url = URL(string: "https://github.com/anditorx")!
        var image: UIImage
        
        if let imageName = coffeeshop.image{
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
        tableView.deselectRow(at: indexPath, animated: true)
        
        // ACTION SHEET
        let actionSheet = UIAlertController(title: "What do you want to do?", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        // action sheet - reserve table
        actionSheet.addAction(UIAlertAction(title: "Reserve a table", style: UIAlertAction.Style.default, handler: { alert in
            self.reserveTable(indexPath.row)
        }))
        
        // action sheet - favorite
        var labelMarkFavorite: String = "Mark as favorite"
        // check ada indexPath.row gak di dalam data array favoritedCoffeeShop
        if coffeeshops[indexPath.row].isFavorite {
            // jika ada, ganti titlenya menjadi remove from favorite
            labelMarkFavorite = "Remove from Favorite"
        }
        
        actionSheet.addAction(UIAlertAction(title: labelMarkFavorite, style: .default, handler: { _ in
            self.toogleFavorite(indexPath.row)
        }))
        
        // action sheet - cancel
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        
        // SHOW ACTION SHEET
        present(actionSheet, animated: true)
        
       
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
        
        if coffeeshops[indexPath.row].isFavorite {
            favoriteString = "Unlike"
        }
        
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

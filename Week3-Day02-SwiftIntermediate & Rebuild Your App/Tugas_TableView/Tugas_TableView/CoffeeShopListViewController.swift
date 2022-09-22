//
//  CoffeeShopListViewController.swift
//  Tugas_TableView
//
//  Created by Armstrong on 17/09/22.
//

import UIKit

class CoffeeShopListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var coffeeshopNames = ["Boja Eatery", "Brewery Coffee", "Casadela Coffee", "Dago Terrace", "Hola Koffie", "Imah Kai", "Jiwan Kopi", "Kilogram Space", "Masagi Coffee", "Nannys Pavillion", "Sabana Kopi", "Sini Kupi", "Sonowae Kopi", "Starbuck Coffee", "Urra Cafe"]

    var coffeeshopImage = ["bojaeatery", "brewery", "casadela", "dagoterrace", "holakoffie", "imahkai", "jiwan", "kilogram", "masagi", "nannys", "sabanakopi", "sinikupi", "sonowae", "starbuck", "urracafe"]

    var coffeeshopLocations = ["Jl. Pungkur", "Jl. Buahbatu", "Jl. Asia Afrika", "Jl. Sudirman", "Jl. Setiabudi", "Jl. Boscha", "Jl. Sukabumi", "Jl. Soekarno Hatta", "Jl. Kopo", "Jl. Dago", "Jl. Cibiru", "Jl. Aceh", "Jl. Cihapit", "Jl. Gandapura", "Jl. Riau"]

    var coffeeshopTypes = ["Coffeeshop / Cafe", "Tea House", "Cafe Shop", "Home Coffee", "Coffeeshop / Cafe", "Tea House", "Cafe", "Home Coffee", "Bakery / Cafe", "Tea House / Cafe", "Coffeeshop / Bakery", "Coffeeshop / Milk House", "Coffeeshop / Cafe", "Bakery", "Warmindo"]
    
    var favoritedCoffeeShop: [Int] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK: - UITableViewDataSource
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeshopNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeShopCellId", for: indexPath) as! CoffeeShopViewCell
        
        cell.thumbImageView.image = UIImage(named: coffeeshopImage[indexPath.row]) // set image
        cell.nameLabel.text = coffeeshopNames[indexPath.row] // set name
        cell.addressLabel.text = coffeeshopLocations[indexPath.row] // set address
        cell.categoryLabel.text = coffeeshopTypes[indexPath.row] // set category
        
        // MARK: - HANDLE FAVORITE COFFEESHOP
        // check item cel mana aja yang ada di array favoritedCoffeeShop
        if favoritedCoffeeShop.contains(where: { index in return index == indexPath.row }) {
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
        print("toogle favorite : \(index)")
        
        // check ada indexPath.row gak di dalam data array favoritedCoffeeShop
        if favoritedCoffeeShop.contains(index) {
            // jika ada, remove dari favoritedCoffeeShop
            if let index = favoritedCoffeeShop.firstIndex(of: index) {
                favoritedCoffeeShop.remove(at: index)
            }
        }else{
            // kalau tidak ada, insert indexnya ke dalam array favoritedCoffeeShop
            favoritedCoffeeShop.append(index)
        }
        
        // kalau reloadData() dia melakukan refresh keseluruhan datanya
        // tableView.reloadData()
        
        // lakukan reload sesuai row yang di pilih saja
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: UITableView.RowAnimation.none)
    }
    
    //MARK: - UITableViewSource
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected cell: \(indexPath.row)") // check item yang di select
        
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
        if favoritedCoffeeShop.contains(indexPath.row) {
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
}

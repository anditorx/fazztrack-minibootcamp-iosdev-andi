//
//  CoffeeShopListViewController.swift
//  Tugas_TableView
//
//  Created by Armstrong on 17/09/22.
//

import UIKit

class CoffeeShopListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var coffeeshopNames = ["Boja Eatery", "Brewery Coffee", "Casadela Coffee", "Dago Terrace", "Hola Koffie", "Imah Kai", "Jiwan Kopi", "Kilogram Space", "Masagi Coffee", "Nannys Pavillion", "Sabana Kopi", "Sini Kupi", "Sonowae Kopi", "Starbuck Coffee", "Urra Cafe"]

    var coffeeshopImage = ["bojaeatery", "brewery", "casadela", "dagoterrace", "holakoffie", "imahkai", "jiwan", "kilogram", "masagi", "nannys", "sabanakopi", "sinikupi", "sonowae", "starbuck", "urracafe"]

    var coffeeshopLocations = ["Jl. Pungkur", "Jl. Buahbatu", "Jl. Asia Afrika", "Jl. Sudirman", "Jl. Setiabudi", "Jl. Boscha", "Jl. Sukabumi", "Jl. Soekarno Hatta", "Jl. Kopo", "Jl. Dago", "Jl. Cibiru", "Jl. Aceh", "Jl. Cihapit", "Jl. Gandapura", "Jl. Riau"]

    var coffeeshopTypes = ["Coffeeshop / Cafe", "Tea House", "Cafe Shop", "Home Coffee", "Coffeeshop / Cafe", "Tea House", "Cafe", "Home Coffee", "Bakery / Cafe", "Tea House / Cafe", "Coffeeshop / Bakery", "Coffeeshop / Milk House", "Coffeeshop / Cafe", "Bakery", "Warmindo"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeshopNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeShopCellId", for: indexPath) as! CoffeeShopViewCell
        
        cell.thumbImageView.image = UIImage(named: coffeeshopImage[indexPath.row]) // set image
        cell.nameLabel.text = coffeeshopNames[indexPath.row] // set name
        cell.addressLabel.text = coffeeshopLocations[indexPath.row] // set address
        cell.categoryLabel.text = coffeeshopTypes[indexPath.row] // set category
        
        return cell
    }

}

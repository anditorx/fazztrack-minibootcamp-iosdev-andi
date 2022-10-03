//
//  CoffeeShopDetailViewController.swift
//  Tugas_TableView
//
//  Created by Armstrong on 03/10/22.
//

import UIKit

class CoffeeShopDetailViewController: UIViewController {

    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var titleDetail: UILabel!
    @IBOutlet weak var subDetail: UILabel!
    
    var data: Any!
    var name: String!
    var thumbnails: String!
    var prepTime: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("isi: \(data!)")
        print("isi: \(name!)")
        print("isi: \(thumbnails!)")
        // Do any additional setup after loading the view.
        
        imageDetail.image = UIImage(named: thumbnails)
        titleDetail.text = name
        subDetail.text = "Prep Time: \(prepTime!)"
        
    }
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

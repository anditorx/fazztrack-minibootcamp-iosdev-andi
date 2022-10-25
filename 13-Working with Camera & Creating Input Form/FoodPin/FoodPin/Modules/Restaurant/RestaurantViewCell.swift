//
//  RestaurantViewCell.swift
//  FoodPin
//
//  Created by Armstrong on 22/10/22.
//

import UIKit


protocol RestaurantViewCellDelegate: NSObjectProtocol {
    func restaurantViewCellTapped(_ cell: RestaurantViewCell)
}

class RestaurantViewCell: UITableViewCell {
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var delegate: RestaurantViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        setup()
    }
    
    func setup() {
        thumbImageView.layer.cornerRadius = 12
        thumbImageView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

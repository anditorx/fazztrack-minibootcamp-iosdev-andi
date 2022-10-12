//
//  HomeCollectionViewCell.swift
//  Medic Meditation App
//
//  Created by Armstrong on 13/10/22.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var imageCollectionBox: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        playButton.layer.cornerRadius = 10
        playButton.layer.masksToBounds = true
    }
    
}

import UIKit
class HomeItem1ViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImgView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    func setup() {
        
        backgroundImgView.layer.cornerRadius = 15
        backgroundImgView.layer.masksToBounds = true
        
        startButton.layer.cornerRadius = 15
        startButton.layer.masksToBounds = true
        
        
    }
    
}



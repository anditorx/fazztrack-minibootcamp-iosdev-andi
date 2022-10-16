import UIKit
protocol HomeItem1ViewCellDelegate: NSObjectProtocol {
    func homeItem1ViewCellStartButtonTapped(_ cell: HomeItem1ViewCell)
}

class HomeItem1ViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImgView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    weak var delegate: HomeItem1ViewCellDelegate?
    
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
    
    @IBAction func startButtonClick(_ sender: Any) {
        delegate?.homeItem1ViewCellStartButtonTapped(self)
    }
    
}



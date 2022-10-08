//
//  HomeViewController.swift
//  SleepApp
//
//  Created by Armstrong on 05/10/22.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        collectionView.dataSource = self;
        collectionView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item2", for: indexPath) as! HomeItem1ViewCell
            
            cell.backgroundImgView.backgroundColor = UIColor.lightGray
            cell.titleLabel.text = "Daily Thought"
            cell.subtitleLabel.text = "MEDITATION"
            cell.durationLabel.text = "5-10 MIN"
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item1", for: indexPath) as! HomeItem1ViewCell
            
            let item = indexPath.item
            cell.backgroundImgView.backgroundColor = item == 0 ? UIColor(rgb: 0x8E97FD) : UIColor(rgb: 0xFFC97E)
            cell.titleLabel.text = item == 0 ? "Basics" : "Relaxation"
            cell.subtitleLabel.text = item == 0 ? "COURSE" : "MUSIC"
            cell.durationLabel.text = item == 0 ? "3-10 MIN" : "5-10 MIN"
            
            return cell
        }
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 2 {
            let leftInset: CGFloat = 20.0
            let rightInset: CGFloat = 20.0
            
            let screenWidth = UIScreen.main.bounds.width
            let width = screenWidth - (leftInset + rightInset)
            let height = 88.0
            return CGSize(width: width, height: height)
        }
        else {
            let leftInset: CGFloat = 20.0
            let rightInset: CGFloat = 20.0
            let itemSpacing: CGFloat = 20.0
            let colomn: CGFloat = 2
            
            let screenWidth = UIScreen.main.bounds.width
            let width = floor((screenWidth - (leftInset + rightInset + (itemSpacing * (colomn - 1)))) / colomn)
            let height = 210 / 177 * width
            return CGSize(width: width, height: height)
        }
    }
}

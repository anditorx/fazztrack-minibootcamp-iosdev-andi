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
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView {
            return 2
        }
        else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionView {
            if section == 0 {
                return 7
            }else{
                return 1
            }
        }
        else {
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView != self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommended", for: indexPath) as! RecommendedViewCell
            
            let isOdd = indexPath.row % 2 == 0
            
            cell.imageView.image = isOdd ?  UIImage(named: "img_focus") :  UIImage(named: "img_happiness")
            cell.titleLabel.text = isOdd ? "Focus" : "Happiness"
            cell.subtitleLabel.text = isOdd ? "5-10 MIN" : "3-7 MIN"
            
            return cell
        }
        else {
            if indexPath.section != 0 {
               
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendedList", for: indexPath) as! RecommendedListViewCell

                cell.collectionView.backgroundColor = .clear
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                return cell

            } else{

                if indexPath.item == 2 {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item2", for: indexPath) as! HomeItem1ViewCell

                    cell.backgroundImgView.backgroundColor = UIColor.lightGray
                    cell.titleLabel.text = "Daily Thought"
                    cell.subtitleLabel.text = "MEDITATION"
                    cell.durationLabel.text = "5-10 MIN"
                    
                    cell.delegate = self
                    
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
    }
    
    // MARK: Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        let titleLabel = view.viewWithTag(100) as! UILabel
        let subtitleLabel = view.viewWithTag(101) as! UILabel
        
        if indexPath.section == 0 {
            titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
            titleLabel.text = "Good Moring"
            subtitleLabel.isHidden = false
            subtitleLabel.text = "We wish you have a good day!"
        }
        else {
            titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
            titleLabel.text = "Recommended for you"
            subtitleLabel.isHidden = true
        }
        
        return view
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == self.collectionView {
            if section == 0 {
                return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
            }
            else {
                return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
            }
        }
        else {
            return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 02)
        }
       
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView != self.collectionView {
            return CGSize(width: 163, height: 175)
        }
        else {
            if indexPath.section != 0 {
                let screenWidth = UIScreen.main.bounds.width
                return CGSize(width: screenWidth, height: 192)
            }
            else {
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
        
    }
}

// MARK: - HomeItem1ViewCellDelegate
extension HomeViewController: HomeItem1ViewCellDelegate {
    func homeItem1ViewCellStartButtonTapped(_ cell: HomeItem1ViewCell) {

        presentPlayerViewController()
//        showPlayerViewController()

    }


}

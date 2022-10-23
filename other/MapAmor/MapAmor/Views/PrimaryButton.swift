//
//  PrimaryButton.swift
//  MapAmor
//
//  Created by Bayu Yasaputro on 14/10/22.
//

import UIKit

@IBDesignable
class PrimaryButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet { update() }
    }
    
    lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        let color0 = UIColor(
            named: "AmorDark",
            in: Bundle(for: self.classForCoder),
            compatibleWith: nil
        )!
        let color1 = UIColor(
            named: "AmorLight",
            in: Bundle(for: self.classForCoder),
            compatibleWith: nil
        )!
        gradientLayer.colors = [color0.cgColor, color1.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        return gradientLayer
    }()

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        gradientLayer.frame = bounds
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        update()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        update()
    }
    
    func update() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
//        backgroundColor = UIColor(
//            named: "AccentColor",
//            in: Bundle(for: self.classForCoder),
//            compatibleWith: nil
//        )
        tintColor = UIColor.white
        
        contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
}

//
//  SecondaryButton.swift
//  MapArmor
//
//  Created by Armstrong on 18/10/22.
//

import UIKit
@IBDesignable

class SecondaryButton: PrimaryButton {

    override func update() {
        super.update()
        backgroundColor = UIColor.secondarySystemFill
        tintColor = UIColor(named: "AccentColor", in: Bundle(for: self.classForCoder), compatibleWith: nil)
        
    }
}

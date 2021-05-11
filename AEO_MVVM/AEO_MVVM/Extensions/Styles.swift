//
//  Styles.swift
//  AEO_MVVM
//
//  Created by Adrián Bolaños Ríos on 11/05/2021.
//

import UIKit

extension UILabel {
    
    static let girassol = "Girassol-Regular"
    
    func styleTitle(text: String) {
        self.font = UIFont(name: UILabel.girassol, size: UIFont.labelFontSize)
        self.text = text.localize()
    }
}

//
//  UILabel + Extensions.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import UIKit
import FontAwesome_swift

extension UILabel {
    func setupIconWithText(text: String, icon: FontAwesome, textSize: CGFloat = 16, fontSize: CGFloat = 20) {
        let textMutable = NSMutableAttributedString()
        textMutable.append(NSAttributedString(string: String.fontAwesomeIcon(name: icon), attributes: [NSAttributedString.Key.font: UIFont.fontAwesome(ofSize: fontSize, style: .solid)]))
        textMutable.append(NSAttributedString(string: " \(text)" , attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: textSize)]))
        self.attributedText = textMutable
    }
}

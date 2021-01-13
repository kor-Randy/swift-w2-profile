//
//  UIView+.swift
//  KakaoProfile
//
//  Created by 지현우 on 2021/01/12.
//

import Foundation
import UIKit

extension UIView {
    func roundView(by n: CGFloat) {
        self.layer.cornerRadius = self.frame.width / n
        self.clipsToBounds = true
    }

    func setBorder(thick: CGFloat, color: CGColor) {
        self.layer.borderWidth = thick
        self.layer.borderColor = color
    }
}

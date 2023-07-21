//
//  CGRect+position.swift
//  API
//
//  Created by Rafal Szastok on 14/06/2020.
//

import UIKit

extension CGRect {
    func by(insets: UIEdgeInsets) -> CGRect {
        return CGRect(
            x: origin.x + insets.left,
            y: origin.y + insets.top,
            width: width - insets.left - insets.right,
            height: height - insets.top - insets.bottom)
    }

    var center: CGPoint {
        return CGPoint(
            x: origin.x + width / 2,
            y: origin.y + height / 2)
    }

    init(center: CGPoint, size: CGSize) {
        let origin = CGPoint(
            x: center.x - size.width / 2,
            y: center.y - size.height / 2)
        self.init(origin: origin, size: size)
    }
}

//
//  UIColor+Hex.swift
//  BabyEatsFood
//
//  Created by Rafal Szastok on 14/06/2020.
//

import UIKit

extension UIColor {
    static func colorWithHexString(hexString: String, alpha: CGFloat = 1.0) -> UIColor {

        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xFF) >> 0) / 255.0

        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }

    static func intFromHexString(hexStr: String) -> UInt64 {
        var hexInt: UInt64 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt64(&hexInt)
        return hexInt
    }
}

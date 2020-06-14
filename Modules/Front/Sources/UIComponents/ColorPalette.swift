//
//  ColorPalette.swift
//  API
//
//  Created by Rafal Szastok on 14/06/2020.
//

import UIKit

enum ColorPalette: String {
    case caribbeanGreen = "0x00C48C"
    case brinkPink = "0xFF647C"
    case whisper = "0xE4E4E4"

    var asUIColor: UIColor {
        return UIColor.colorWithHexString(hexString: self.rawValue)
    }
}

//
//  ColorStruct.swift
//  Swift-1AllForOne
//
//  Created by Gabriel Toro on 12-07-22.
//

import Foundation
import UIKit

struct ColorStruct {
    var color: UIColor?
    var text: String?

    init(color: UIColor? = nil, text: String? = nil) {
        self.color = color
        self.text = text
    }
}

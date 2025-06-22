//
//  CodableColor.swift
//  Humorize
//
//  Created by Vagner Leite da Silva on 07/06/25.
//

import Foundation
import SwiftUI

struct CodableColor: Codable {
    var red: Double
    var green: Double
    var blue: Double

    init(_ color: Color) {
        let scanner = Scanner(string: color.description.trimmingCharacters(in: .letters.inverted))
        var hexNumber: UInt64 = 0
        scanner.scanHexInt64(&hexNumber)

        self.red = Double((hexNumber >> 16) & 0xFF) / 255
        self.green = Double((hexNumber >> 8) & 0xFF) / 255
        self.blue = Double(hexNumber & 0xFF) / 255
    }

    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }

    var color: Color {
        Color(red: red, green: green, blue: blue)
    }
}

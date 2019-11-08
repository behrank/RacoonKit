//
//  Common.swift
//  Pods-RacoonTools_Tests
//
//  Created by Behran Kankul on 15.05.2019.
//

import ImageIO

struct ImageHeaderData{
    static var PNG: [UInt8] = [0x89]
    static var JPEG: [UInt8] = [0xFF]
    static var GIF: [UInt8] = [0x47]
    static var TIFF_01: [UInt8] = [0x49]
    static var TIFF_02: [UInt8] = [0x4D]
}

enum ImageFormat{
    case Unknown, PNG, JPEG, GIF, TIFF
}

enum RacoonDimension {
    case top(value: CGFloat = 0), left(value: CGFloat = 0), right(value: CGFloat = 0), bottom(value: CGFloat = 0)
}

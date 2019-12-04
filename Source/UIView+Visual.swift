//
//  UIView+Visual.swift
//  RacoonKit
//
// The MIT License (MIT)

// Copyright (c) 2019 Can Behran Kankul

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit

// MARK: Visual
extension UIView {
    
    /// RK: Sets corner radius
    /// - Parameter radius: CGFloat
    public func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    /// RK: Add shadow to view
    /// - Parameter offset: CGSize
    /// - Parameter radius: CGFloat
    /// - Parameter color: UIColor
    /// - Parameter opacity: Float
    /// - Parameter cornerRadius: CGFloat - Default nil
    public func addShadow(offset: CGSize, radius: CGFloat, color: UIColor, opacity: Float, cornerRadius: CGFloat? = nil) {
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color.cgColor
        if let cr = cornerRadius {
            self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cr).cgPath
        }
    }
    /// RK: Add border to view with custom color
    /// - Parameter width: CGFloat
    /// - Parameter color: UIColor
    public func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
    /// RK: Add border to view with custom color
    /// - Parameter dimension: RacoonDimension
    /// - Parameter value: CGFloat - Default is 0
    /// - Parameter color: UIColor
//    public func addBorderForDimension(for dimension: RacoonDimension, color: UIColor) {
//        
//        switch dimension {
//            case .top(let value):
//                addBorderFor(x: 0, y: 0, width: frame.width, height: value, color: color)
//            case .bottom(let value):
//                addBorderFor(x: 0, y: frame.height - value, width: frame.width, height: value, color: color)
//            case .left(let value):
//                addBorderFor(x: 0, y: 0, width: value, height: frame.height, color: color)
//            case .right(let value):
//                addBorderFor(x: frame.width - value, y: 0, width: value, height: frame.height, color: color)
//        }
//    }
    
    fileprivate func addBorderFor(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        layer.addSublayer(border)
    }
}

//
//  UIView+Visual.swift
//  RacoonKit
//
//  Created by Can Behran Kankul on 5.11.2019.
//

import UIKit

// MARK: Visual
extension UIView {
    
    /// RT: Sets corner radius
    /// - Parameter radius: CGFloat
    public func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    /// RT: Add shadow to view
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
    /// RT: Add border to view with custom color
    /// - Parameter width: CGFloat
    /// - Parameter color: UIColor
    public func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
        layer.masksToBounds = true
    }
    /// RT: Add border to view with custom color
    /// - Parameter dimension: RacoonDimension
    /// - Parameter value: CGFloat - Default is 0
    /// - Parameter color: UIColor
    public func addBorderForDimension(for dimension: RacoonDimension, color: UIColor) {
        switch dimension {
            case .top(let value):
                addBorderFor(x: 0, y: 0, width: frame.width, height: value, color: color)
            case .bottom(let value):
                addBorderFor(x: 0, y: frame.height - value, width: frame.width, height: value, color: color)
            case .left(let value):
                addBorderFor(x: 0, y: 0, width: value, height: frame.height, color: color)
            case .right(let value):
                addBorderFor(x: frame.width - value, y: 0, width: value, height: frame.height, color: color)
        }
    }
    fileprivate func addBorderFor(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: x, y: y, width: width, height: height)
        layer.addSublayer(border)
    }
}

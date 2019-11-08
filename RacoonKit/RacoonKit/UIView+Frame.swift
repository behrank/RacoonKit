//
//  UIView+Frame.swift
//  Pods-RacoonTools_Tests
//
//  Created by Can Behran Kankul on 5.11.2019.
//

import UIKit

// MARK: Frame
extension UIView {
    
    /// Gives and sets of a view's X coordinate
    ///
    /// - Parameter value: CGFloat
    public var frameX: CGFloat {
        get {
            return self.frame.origin.x
        } set(value) {
            self.frame = CGRect(x: value, y: self.frameY, width: self.frameWidth, height: self.frameHeight)
        }
    }
    
    /// Gives and sets of a view's Y coordinate
    ///
    /// - Parameter value: CGFloat
    public var frameY: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect(x: self.frameX, y: value, width: self.frameWidth, height: self.frameHeight)
        }
    }
    
    /// Gives and sets of a view's width value
    ///
    /// - Parameter value: CGFloat
    public var frameWidth: CGFloat {
        get {
            return self.frame.size.width
        } set(value) {
            self.frame = CGRect(x: self.frameX, y: self.frameY, width: value, height: self.frameHeight)
        }
    }
    /// Gives and sets of a view's height value
    ///
    /// - Parameter value: CGFloat
    public var frameHeight: CGFloat {
        get {
            return self.frame.size.height
        } set(value) {
            self.frame = CGRect(x: self.frameX, y: self.frameY, width: self.frameWidth, height: value)
        }
    }
    /// Gives and sets of a view's min X value
    ///
    /// - Parameter value: CGFloat
    public var left: CGFloat {
        get {
            return self.frameX
        } set(value) {
            self.frameX = value
        }
    }
    /// Gives and sets of a view's max X value
    ///
    /// - Parameter value: CGFloat
    public var right: CGFloat {
        get {
            return self.frameX + self.frameWidth
        } set(value) {
            self.frameX = value - self.frameWidth
        }
    }
    /// Gives and sets of a view's min Y value
    ///
    /// - Parameter value: CGFloat
    public var top: CGFloat {
        get {
            return self.frameY
        } set(value) {
            self.frameY = value
        }
    }
    /// Gives and sets of a view's max Y value
    ///
    /// - Parameter value: CGFloat
    public var bottom: CGFloat {
        get {
            return self.frameY + self.frameHeight
        } set(value) {
            self.frameY = value - self.frameHeight
        }
    }
}

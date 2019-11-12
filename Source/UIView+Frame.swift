//
//  UIView+Frame.swift
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

// MARK: Frame
extension UIView {
    
    /// RK: Gives and sets of a view's X coordinate
    /// - Parameter value: CGFloat
    public var frameX: CGFloat {
        get {
            return self.frame.origin.x
        } set(value) {
            self.frame = CGRect(x: value, y: self.frameY, width: self.frameWidth, height: self.frameHeight)
        }
    }
    
    /// RK: Gives and sets of a view's Y coordinate
    /// - Parameter value: CGFloat
    public var frameY: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect(x: self.frameX, y: value, width: self.frameWidth, height: self.frameHeight)
        }
    }
    
    /// RK: Gives and sets of a view's width value
    /// - Parameter value: CGFloat
    public var frameWidth: CGFloat {
        get {
            return self.frame.size.width
        } set(value) {
            self.frame = CGRect(x: self.frameX, y: self.frameY, width: value, height: self.frameHeight)
        }
    }
    /// RK: Gives and sets of a view's height value
    /// - Parameter value: CGFloat
    public var frameHeight: CGFloat {
        get {
            return self.frame.size.height
        } set(value) {
            self.frame = CGRect(x: self.frameX, y: self.frameY, width: self.frameWidth, height: value)
        }
    }
    /// RK: Gives and sets of a view's min X value
    /// - Parameter value: CGFloat
    public var left: CGFloat {
        get {
            return self.frameX
        } set(value) {
            self.frameX = value
        }
    }
    /// RK: Gives and sets of a view's max X value
    /// - Parameter value: CGFloat
    public var right: CGFloat {
        get {
            return self.frameX + self.frameWidth
        } set(value) {
            self.frameX = value - self.frameWidth
        }
    }
    /// RK: Gives and sets of a view's min Y value
    /// - Parameter value: CGFloat
    public var top: CGFloat {
        get {
            return self.frameY
        } set(value) {
            self.frameY = value
        }
    }
    /// RK: Gives and sets of a view's max Y value
    /// - Parameter value: CGFloat
    public var bottom: CGFloat {
        get {
            return self.frameY + self.frameHeight
        } set(value) {
            self.frameY = value - self.frameHeight
        }
    }
}

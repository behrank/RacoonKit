//
//  UIView+Positioning.swift
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

// MARK: Adding & Removing
extension UIView {
    
    /// RK: Adds constraints with visual format (String)
    /// - Parameter format: String
    /// - Parameter views: UIView and its subclasses
    public func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDic = [String: UIView]()
        
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDic[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDic))
    }
    /// RK: Sets margins for view for its superview
    /// - Parameter margins: an array of RacoonDimension with value
    public func setMargins(_ margins: RacoonDimension...) {
        if let superView = self.superview {
            
//            for margin in margins {
//                switch margin {
//                    case .top(let value):
//                        superView.addConstraintsWithFormat(format: "V:|-\(value)-[v0]", views: self)
//                    case .bottom(let value):
//                        superView.addConstraintsWithFormat(format: "V:[v0]-\(value)-|", views: self)
//                    case .right(let value):
//                        superView.addConstraintsWithFormat(format: "H:[v0]-\(value)-|", views: self)
//                    case .left(let value):
//                        superView.addConstraintsWithFormat(format: "H:|-\(value)-[v0]", views: self)
//                }
//            }
        }
    }
    /// RK: Sets margin for view for its superview
    /// - Parameter view: UIView and its subclasses
    /// - Parameter margin: RacoonDimension with value
    public func setMarginTo(view: UIView, of margin: RacoonDimension) {

        if let superView = self.superview {
//            switch margin {
//                case .top(let value):
//                    superView.addConstraintsWithFormat(format: "V:[v0]-\(value)-[v1]", views: self, view)
//                case .bottom(let value):
//                    superView.addConstraintsWithFormat(format: "V:[v1]-\(value)-[v0]", views: self, view)
//                case .right(let value):
//                    superView.addConstraintsWithFormat(format: "H:[v1]-\(value)-[v0]", views: self, view)
//                case .left(let value):
//                    superView.addConstraintsWithFormat(format: "H:[v0]-\(value)-[v1]", views: self, view)
//            }
        }

    }
    /// RK: Sets of a view's width
    /// - Parameter value: CGFloat
    public func setWidth(_ value: CGFloat) {
        addConstraintsWithFormat(format: "H:[v0(\(value))]", views: self)
    }
    /// RK: Sets equal of a view's width to its superview
    public func setWidthEqualToSuperview() {
        if let superView = self.superview {
            superView.addConstraintsWithFormat(format: "H:|[v0]|", views: self)
        }
    }
    /// RK: Sets view's width equal to other view
    /// - Parameter view: UIView and its subclasses
    public func setWidthEqualTo(view: UIView) {
        if let superView = self.superview {
            superView.addConstraintsWithFormat(format: "H:[v0(==v1)]", views: self, view)
        }
    }
    /// RK: Sets view's width equal to multiple views
    /// - Parameter views: an array of UIView and its subclasses
    public func setWidthEqualTo(views: UIView...) {
        if let superView = self.superview {
            for view in views {
                superView.addConstraintsWithFormat(format: "H:[v0(==v1)]", views: self, view)
            }
        }
    }
    /// RK: Sets of a view's height
    /// - Parameter value: CGFloat
    public func setHeight(_ value: CGFloat) {
        addConstraintsWithFormat(format: "V:[v0(\(value))]", views: self)
    }
    
    /// RK: Sets equal of a view's height to its superview
    public func setHeightEqualToSuperview() {
        if let superView = self.superview {
            superView.addConstraintsWithFormat(format: "V:|[v0]|", views: self)
        }
    }
    /// RK: Sets view's height equal to other view
    /// - Parameter view: UIView and its subclasses
    public func setHeightEqualTo(view: UIView) {
        if let superView = self.superview {
            superView.addConstraintsWithFormat(format: "V:[v0(==v1)]", views: self, view)
        }
    }
    /// RK: Sets view's height equal to multiple views
    /// - Parameter views: an array of UIView and its subclasses
    public func setHeightEqualTo(views: UIView...) {
        if let superView = self.superview {
            for view in views {
                superView.addConstraintsWithFormat(format: "V:[v0(==v1)]", views: self, view)
            }
        }
    }
    /// RK: Sets view's height and width equal to a view
    /// - Parameter views: an array of UIView and its subclasses
    public func setEqualDimesionsWith(view: UIView) {
        setWidthEqualTo(view: view)
        setHeightEqualTo(view: view)
    }
    /// RK: Sets view's height and width equal to its superview
    public func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    /// RK: Places a view according to its margins
    ///
    ///- Parameter top: top anchor of superview
    ///- Parameter left: left anchor of superview
    ///- Parameter bottom: bottom anchor of superview
    ///- Parameter right: right anchor of superview
    ///- Parameter topConstant: top margin from superview's top edge
    ///- Parameter leftConstant: left margin from superview's left edge
    ///- Parameter bottomConstant: bottom margin from superview's bottom edge
    ///- Parameter rightConstant: right margin from superview's right edge
    public func anchor(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        _ = anchorWithReturnAnchors(top, left: left, bottom: bottom, right: right, topConstant: topConstant, leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant, widthConstant: widthConstant, heightConstant: heightConstant)
    }
    /// RK: Places a view according to its margins. Returns added constraints
    ///
    ///- Parameter top: top anchor of superview
    ///- Parameter left: left anchor of superview
    ///- Parameter bottom: bottom anchor of superview
    ///- Parameter right: right anchor of superview
    ///- Parameter topConstant: top margin from superview's top edge
    ///- Parameter leftConstant: left margin from superview's left edge
    ///- Parameter bottomConstant: bottom margin from superview's bottom edge
    ///- Parameter rightConstant: right margin from superview's right edge
    public func anchorWithReturnAnchors(_ top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }
        
        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }
        
        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    /// RK: Aligns view to superview horizontaly
    public func anchorCenterXToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    /// RK: Aligns view to superview verticaly
    public func anchorCenterYToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    /// RK: Places to view superview center
    public func anchorCenterSuperview() {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
    
    /// Adds view to its super view with 16px spacing
    ///
    /// - Parameter view: UIView, UICollectionViewCell, UITableViewCell
    func attachViewWithDefaultMarginTo(view:UIView){
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: self)
        view.addConstraintsWithFormat(format: "V:|-16-[v0(\(16))]", views: self)
    }
    
    /// Adds input view to its super view after a view
    ///
    /// - Parameter after: UIView
    /// - Parameter inView: UIView, UICollectionViewCell, UITableViewCell
    func attachSelfAfterView(after: UIView, inView: UIView){
        inView.addConstraintsWithFormat(format: "V:[v0]-0-[v1]", views: after, self)
    }
    
}

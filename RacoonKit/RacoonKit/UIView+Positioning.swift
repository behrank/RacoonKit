//
//  UIView+Positioning.swift
//  Pods-RacoonTools_Tests
//
//  Created by Can Behran Kankul on 5.11.2019.
//

import UIKit

// MARK: Adding & Removing
extension UIView {
    
    /// Adds constraints with visual format (String)
    ///
    /// - Parameter format: String 
    /// - Parameter views: UIView and its subclasses
    
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDic = [String: UIView]()
        
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDic[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDic))
    }
    
    func setMargins(_ margins: RacoonDimension...) {
        if let superView = self.superview {
            
            for margin in margins {
                switch margin {
                    case .top(let value):
                    superView.addConstraintsWithFormat(format: "V:|-\(value)-[v0]", views: self)
                    case .bottom(let value):
                    superView.addConstraintsWithFormat(format: "V:[v0]-\(value)-|", views: self)
                    case .right(let value):
                    superView.addConstraintsWithFormat(format: "H:[v0]-\(value)-|", views: self)
                    case .left(let value):
                    superView.addConstraintsWithFormat(format: "H:|-\(value)-[v0]", views: self)
                }
            }
        }
    }
    
    func setMarginTo(view: UIView, of margin: RacoonDimension, value: CGFloat) {
        if let superView = self.superview {
            switch margin {
                case .top(let value):
                superView.addConstraintsWithFormat(format: "V:[v0]-\(value)-[v1]", views: self, view)
                case .bottom(let value):
                superView.addConstraintsWithFormat(format: "V:[v1]-\(value)-[v0]", views: self, view)
                case .right(let value):
                superView.addConstraintsWithFormat(format: "H:[v1]-\(value)-[v0]", views: self, view)
                case .left(let value):
                superView.addConstraintsWithFormat(format: "H:[v0]-\(value)-[v1]", views: self, view)
            }
        }
    }
    
    /// Sets of a view's width
    ///
    /// - Parameter value: CGFloat
    func setWidth(_ value: CGFloat) {
        addConstraintsWithFormat(format: "H:[v0(\(value))]", views: self)
    }
    
    /// Set equal of a view's width to its superview
    ///
    ///
    func setWidthEqualToSuperview() {
        if let superView = self.superview {
            superView.addConstraintsWithFormat(format: "H:|[v0]|", views: self)
        }
    }
    
    func setWidthEqualTo(view: UIView) {
        addConstraintsWithFormat(format: "H:[v0(==v1)]", views: self, view)
    }
    
    func setWidthEqualTo(views: UIView...) {
        for view in views {
            addConstraintsWithFormat(format: "H:[v0(==v1)]", views: self, view)
        }
    }
    /// Sets of a view's height
    ///
    /// - Parameter value: CGFloat

    func setHeight(_ value: CGFloat) {
        addConstraintsWithFormat(format: "V:[v0(\(value))]", views: self)
    }

    /// Set equal of a view's height to its superview
    ///
    ///
    func setHeightEqualToSuperview() {
        if let superView = self.superview {
            superView.addConstraintsWithFormat(format: "V:|[v0]|", views: self)
        }
    }
    
    func setHeightEqualTo(view: UIView) {
        addConstraintsWithFormat(format: "V:[v0(==v1)]", views: self, view)
    }
    
    func setHeightEqualTo(views: UIView...) {
        for view in views {
            addConstraintsWithFormat(format: "V:[v0(==v1)]", views: self, view)
        }
    }
    
    func setEqualDimesionsWith(view: UIView) {
        setWidthEqualTo(view: view)
        setHeightEqualTo(view: view)
    }
    
    /// Set equal of a view's height and width to its superview
    ///
    ///
    public func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
            rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
            topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    
    /// Places a view according to its margins
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
    
    /// Places a view according to its margins. Returns added constraints
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
    /// Aligns view to superview horizontaly
    ///
    ///
    public func anchorCenterXToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    /// Aligns view to superview verticaly
    ///
    ///
    public func anchorCenterYToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }
    /// Places to view superview center
    ///
    ///
    public func anchorCenterSuperview() {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }
}

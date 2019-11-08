//
//  UIView.swift
//  Pods-RacoonTools_Tests
//
//  Created by Behran Kankul on 15.05.2019.
//

import UIKit

// MARK: Adding & Removing
extension UIView {
    
    /// Adds views to superview with single command
    ///
    /// - Parameter views: UIView and its subclasses
    
    public func addSubviews(views: UIView...) {
        views.forEach { (view) in
            self.addSubview(view)
        }
    }
    
    /// Removes subviews of superview
    ///
    /// 
    
    public func removeSubviews() {
        
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}

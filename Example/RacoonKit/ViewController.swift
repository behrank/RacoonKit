//
//  ViewController.swift
//  RacoonKit
//
//  Created by behrank on 11/12/2019.
//  Copyright (c) 2019 behrank. All rights reserved.
//

import UIKit
import RacoonKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //How to add subviews.
        let firstView = UIView()
        let secondView = UIView()
        let thirdView = UIView()
        let fourthView = UIView()
        view.addSubviews(views: firstView, secondView, thirdView, fourthView)
        
        //How to set margins to either self and other UIView subclasses
        firstView.setMargins(RacoonDimension.top(value: 8), RacoonDimension.left(value: 8), RacoonDimension.right(value: 8), RacoonDimension.bottom(value: 8))
        firstView.setMarginTo(view: secondView, with: RacoonDimension.top(value: 12))
        
        //How to set dimensions
        firstView.setHeight(100)
        firstView.setWidth(125)
        firstView.setWidthEqualToSuperview()
        firstView.setHeightEqualToSuperview()
        firstView.setWidthEqualTo(view: fourthView)
        firstView.setHeightEqualTo(view: secondView)
        firstView.setWidthEqualTo(views: secondView, thirdView, fourthView)
        firstView.setHeightEqualTo(views: secondView, thirdView, fourthView)
        
        /*
            RacoonFormat
                - With version 1.0 you can define priority and equal properties.
                - Use setMarginWith(formats: RacoonFormat...) method to define multiple constraints.
         */
        
        firstView.setMarginWith(formats: RacoonFormat(constant: .top(value: 0)))
        firstView.setMarginWith(formats: RacoonFormat(constant: .left(value: 10), equality: RacoonEquality.greaterOrEqual))
        firstView.setMarginWith(formats: RacoonFormat(constant: .right(value: 20), equality: RacoonEquality.lessOrEqual, priority: RacoonPriority.high))
        
        // Use RacoonFormat for setting relationships between two views
        firstView.setMarginTo(view: secondView, with: RacoonFormat(constant: .top(value: 0)))
        firstView.setMarginTo(view: secondView, with: RacoonFormat(constant: .left(value: 10), equality: RacoonEquality.greaterOrEqual))
        firstView.setMarginTo(view: secondView, with: RacoonFormat(constant: .right(value: 20), equality: RacoonEquality.lessOrEqual, priority: RacoonPriority.high))
    }
}


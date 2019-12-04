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
        firstView.setMarginTo(view: secondView, of: RacoonDimension.top(value: 12))
        
        //How to set dimensions
        firstView.setHeight(100)
        firstView.setWidth(125)
        firstView.setWidthEqualToSuperview()
        firstView.setHeightEqualToSuperview()
        firstView.setWidthEqualTo(view: fourthView)
        firstView.setHeightEqualTo(view: secondView)
        firstView.setWidthEqualTo(views: secondView, thirdView, fourthView)
        firstView.setHeightEqualTo(views: secondView, thirdView, fourthView)
        
        let format = RacoonFormat(constant: RacoonDimension.top(value: 0), equality: RacoonEquality.equal, priority: RacoonPriority.high)
    }
}


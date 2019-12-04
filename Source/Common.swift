//
//  Common.swift
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

public enum RacoonPriority {
    case none, required, high, low
    
    public var asValue: String {
        switch self {
            case .none:
                return ""
            case .low:
                return "@250"
            case .high:
                return "@750"
            case .required:
                return "@1000"
        }
    }
}

public enum RacoonEquality {
    case none, equal, greaterOrEqual, lessOrEqual
    
    public var asValue: String {
        switch self {
            case .none:
                return ""
            case .equal:
                return "=="
            case .greaterOrEqual:
                return ">="
            case .lessOrEqual:
                return "<="
        }
    }
}

public enum RacoonDimension {
    case none, top(value: CGFloat = 0), left(value: CGFloat = 0), right(value: CGFloat = 0), bottom(value: CGFloat = 0)
    
    public var asValue: String {
        switch self {
            case .top(let value), .left(let value), .right(let value), .bottom(let value):
                return "\(value)"
            default:
                return ""
        }
    }
}

public struct RacoonFormat {
    var constant: RacoonDimension           = .none
    private var priority: RacoonPriority    = .none
    private var equality: RacoonEquality    = .none
    
    public init(constant: RacoonDimension) {
        self.constant = constant
    }
    
    public init(constant: RacoonDimension, priority: RacoonPriority) {
        self.constant = constant
        self.priority = priority
    }
    
    public init(constant: RacoonDimension, equality: RacoonEquality) {
        self.constant = constant
        self.equality = equality
    }
    
    public init(constant: RacoonDimension, equality: RacoonEquality, priority: RacoonPriority) {
        self.constant = constant
        self.priority = priority
        self.equality = equality
    }
    
    public func constantAsValue() -> String {
        if self.priority != .none && self.equality == .none {
            return valueWithPriority()
        } else if self.priority == .none && self.equality != .none {
            return valueWithEquality()
        } else if self.priority != .none && self.equality != .none {
            return valueWithPriorityAndEquality()
        } else {
            return getConstant()
        }
    }

    private func getConstant() -> String {
        return "\(constant.asValue)"
    }
    
    private func valueWithPriority() -> String {
        return self.constant.asValue.appending(self.priority.asValue)
    }
    
    private func valueWithEquality() -> String {
        return self.equality.asValue.appending(self.constant.asValue)
    }
    
    private func valueWithPriorityAndEquality() -> String {
        return valueWithEquality().appending(self.priority.asValue)
    }
}




//
//  Direction.swift
//  Crossword
//
//  Created by PJ on 07/04/2017.
//  Copyright © 2017 AKQA. All rights reserved.
//

import Foundation

enum Direction {
    case left
    case right
    case up
    case down
    case upLeft
    case upRight
    case downLeft
    case downRight
    
    static let allDirections: [Direction] = {
        return [.left, .right, .up, .down, .upLeft, .upRight, .downLeft, .downRight]
    }()
    
    var name: String {
        get {
            switch self {
            case .left: return "left"
            case .right: return "right"
            case .up: return "up"
            case .down: return "down"
            case .upLeft: return "upLeft"
            case .upRight: return "upRight"
            case .downLeft: return "downLeft"
            case .downRight: return "downRight"
            }
        }
    }
}

extension Point {
    // Allows you to increment the current point in a direction by an arbitrary amount
    func incrementBy(direction: Direction, amount: Int) -> Point {
        switch direction {
        case .up: return Point(x: x, y: y-amount)
        case .down: return Point(x: x, y: y+amount)
        case .left: return Point(x: x-amount, y: y)
        case .right: return Point(x: x+amount, y: y)
        case .upLeft: return Point(x: x-amount, y: y-amount)
        case .upRight: return Point(x: x+amount, y: y-amount)
        case .downLeft: return Point(x: x-amount, y: y+amount)
        case .downRight: return Point(x: x+amount, y: y+amount)
        }
    }
}

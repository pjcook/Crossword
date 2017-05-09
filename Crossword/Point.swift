//
//  Point.swift
//  Crossword
//
//  Created by PJ on 07/04/2017.
//  Copyright © 2017 AKQA. All rights reserved.
//

import Foundation

struct Point: Hashable {
    let x: Int
    let y: Int
    
    // Bounds check
    func isValid(gridSize: Size) -> Bool {
        return x >= 0 && x <= gridSize.width && y >= 0 && y <= gridSize.height
    }
}

// Required so you can put it in arrays and dictionaries etc
extension Point: Equatable {
    var hashValue: Int {
        get {
            return x.hashValue + y.hashValue
        }
    }
    static func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

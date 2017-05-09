//
//  Solution.swift
//  Crossword
//
//  Created by PJ on 07/04/2017.
//  Copyright © 2017 AKQA. All rights reserved.
//

import Foundation

/* 
 * Used to store which Word was found at which point in the grid and the direction that the word faces from that starting point
 */
struct Solution {
    let word: String!
    let point: Point!
    let direction: Direction!
}

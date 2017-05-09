//
//  SolutionPrinter.swift
//  Crossword
//
//  Created by PJ on 07/04/2017.
//  Copyright © 2017 AKQA. All rights reserved.
//

import Foundation

func printSolution(board: Board) {
    for solved in board.solvedWordList {
        print("\(solved.word!): (\(solved.point.x),\(solved.point.y)) \(solved.direction.name)")
    }
    let wordList = board.unSolvedWordList.values.flatMap { $0 }
    for word in wordList {
        print("\(word) Not Found")
    }
    
    print("\(board.solvedWordList.count) of \(board.solvedWordList.count + wordList.count) words found.\n")
    
//    print("Start (\(board.size.height)x\(board.size.width)): \(board.createdTime)")
//    print("Time to resolve: \(abs(board.createdTime.timeIntervalSince(board.solveTime!)))")
//    print("Complete: \(Date())\n")
}

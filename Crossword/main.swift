//
//  main.swift
//  Crossword
//
//  Created by PJ on 05/04/2017.
//  Copyright © 2017 AKQA. All rights reserved.
//

import Foundation

//var filename = "input3.txt"
//for argument in CommandLine.arguments {
//    let detail = argument.components(separatedBy: ":")
//    if detail.count == 2 {
//        let key = detail[0]
//        let value = detail[1]
//        if key == "filename" && value.characters.count > 0 {
//            filename = value
//        }
//    }
//}

let size = readLine()!
let grid = readLine()!
let words = readLine()!
let data = [size,grid,words]
do {
//    let data = try openFile(filename: filename)
    var (board, wordList) = try createBoard(array: data)
    board.solve(wordList: wordList)
    printSolution(board: board)
}
catch let error {
    print(error)
}



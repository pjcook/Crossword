//
//  CrosswordFileParser.swift
//  Crossword
//
//  Created by PJ on 07/04/2017.
//  Copyright © 2017 AKQA. All rights reserved.
//

import Foundation

enum CrosswordErrors: Error {
    case invalidFile
    case failedToOpenFile
    case invalidDataNotEnoughLines
    case invalidDataInvalidDimensions
    case invalidDataInvalidCharacterList
    case invalidDataInvalidWordList
}

func openFile(filename: String) throws -> [String] {
    guard let path = Bundle.main.path(forResource: filename, ofType: nil) else {
        throw(CrosswordErrors.invalidFile)
    }
    
    let array: [String]
    do {
        let data = try String(contentsOfFile: path)
        array = data.components(separatedBy: "\n")
    }
    catch let error {
        print(error)
        throw(CrosswordErrors.failedToOpenFile)
    }
    
    return array
}

func createBoard(array: [String]) throws -> (Board, [String]) {
    // 3 lines: dimensions, board characters, word list
    if array.count != 3 {
        throw(CrosswordErrors.invalidDataNotEnoughLines)
    }
    
    // board dimensions
    let dimensions = array[0].components(separatedBy: ",")
    if dimensions.count != 2 {
        throw(CrosswordErrors.invalidDataInvalidDimensions)
    }
    guard let width = Int(dimensions[1]) else {
        throw(CrosswordErrors.invalidDataInvalidDimensions)
    }
    guard let height = Int(dimensions[0]) else {
        throw(CrosswordErrors.invalidDataInvalidDimensions)
    }
    let size = Size(width: width, height: height)
    print("Start (\(size.height)x\(size.width))")
    
    // board characters
    let characters = array[1].components(separatedBy: ",")
    if characters.count != size.width * size.height {
        throw(CrosswordErrors.invalidDataInvalidCharacterList)
    }
    
    // word list
    let wordList = array[2].components(separatedBy: ",")
    if wordList.count == 0 {
        throw(CrosswordErrors.invalidDataInvalidWordList)
    }

    let board = Board(size: size, board: characters.chunk(size.width))
    return (board,wordList)
}

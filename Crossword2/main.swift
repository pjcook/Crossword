//
//  main.swift
//  Crossword2
//
//  Created by PJ on 4/18/17.
//  Copyright © 2017 AKQA. All rights reserved.
//

import Foundation

typealias Word = Array<CChar>

struct Direction {
    let n: Int
    let s: Int
    let e: Int
    let w: Int
    let nw: Int
    let ne: Int
    let sw: Int
    let se: Int
    
    func allValues() -> [Int] {
        return [n,s,e,w,nw,ne,sw,se]
    }
    
    init(span: Int) {
        nw = -span-1
        n = -span
        ne = -span+1
        w = -1
        e = 1
        sw = span-1
        s = span
        se = span+1
    }
    
    func name(direction: Int) -> String {
        switch direction {
        case n: return "N"
        case s: return "S"
        case e: return "E"
        case w: return "W"
        case nw: return "NW"
        case ne: return "NE"
        case sw: return "SW"
        case se: return "SE"
        default: return "Invalid"
        }
    }
}

let size = readLine()!.components(separatedBy: ",")
var grid = readLine()!.components(separatedBy: ",").map { $0.cString(using: String.Encoding.utf8)![0] }
var words: [Word] = readLine()!.components(separatedBy: ",").map { Array($0.cString(using: String.Encoding.utf8)!) }

let rowCount = Int(size[0])!
let colCount = Int(size[1])!
let direction = Direction(span: colCount)

func printFound(word: Word, index: Int, colCount: Int, d: Int) {
    let row = Int(index / colCount)
    let col = index - (row * colCount)
    print("\(String(cString: word)) (\(row),\(col)) \(direction.name(direction: d))")
}

func find(word: Word, index: Int, colCount: Int) -> Bool {
    let letter = word[1]
    for d in direction.allValues() {
        let nextIndex = d + index
        if nextIndex >= grid.count || nextIndex < 0 {
            continue
        }
        let nextLetter = grid[nextIndex]
        if nextLetter == letter {
            if word.count-1 > 2 {
                if find(word: word, index: nextIndex, letterIndex: 2, direction: d, colCount: colCount) {
                    printFound(word: word, index: index, colCount: colCount, d: d)
                    return true
                }
            }
            else {
                printFound(word: word, index: index, colCount: colCount, d: d)
                return true
            }
        }
    }
    return false
}

func find(word: Word, index: Int, letterIndex: Int, direction: Int, colCount: Int) -> Bool {
    var index = index
    var letterIndex = letterIndex
    while word.count-1 > letterIndex {
        let nextIndex = direction + index
        if nextIndex >= grid.count || nextIndex < 0 {
            return false
        }
        let letter = word[letterIndex]
        let nextLetter = grid[nextIndex]
        if nextLetter != letter {
            return false
        }
        letterIndex += 1
        index = nextIndex

    }
    return true
}

var wordList: [CChar:[Word]] = [:]
words.sort { (item1, item2) -> Bool in
    return item1[0] > item2[0]
}

var filteredWords: [Word] = []
var letter = words[0][0]
for word in words {
    let wordChar = word[0]
    if wordChar == letter {
        filteredWords.append(word)
    }
    else {
        wordList[letter] = filteredWords
        filteredWords = []
        filteredWords.append(word)
        letter = wordChar
    }
}
if filteredWords.count > 0 {
    wordList[letter] = filteredWords
}

var foundCount = 0
for index in 0..<grid.count {
    let letter = grid[index]
    if let words = wordList[letter] {
        var wordsLeft = wordList[letter]!
        for i in 0..<words.count {
            let word = words[i]
            if find(word: word, index: index, colCount: colCount) {
                var j = 0
                for w in wordsLeft {
                    if w == word {
                        break
                    }
                    j += 1
                }
                wordsLeft.remove(at: j)
                wordList[letter] = wordsLeft
                foundCount += 1
            }
        }
        
        if wordList.count == 0 {
            break
        }
    }
}

for (_, words) in wordList {
    for word in words {
        print("\(String(cString: word)) Not Found")
    }
}

print("\nFound \(foundCount) of \(words.count)")

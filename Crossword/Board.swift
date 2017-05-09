import Foundation

class Board {
    let size: Size!
    let board: [[String]]!
    private(set) var unSolvedWordList: [String:[String]] = [:]
    private(set) var solvedWordList: [Solution] = []
    private(set) var createdTime: Date = Date()
    private(set) var solveTime: Date? = nil
    private(set) var startTime: Date? = nil
    
    init(size: Size, board: [[String]]) {
        self.size = size
        self.board = board
    }
    
    func solve(wordList: [String]) {
        var optimisedWordList = crunchWordList(wordList: wordList)
        let startTime = Date()
        var finishedEarly = false
        for r in 0..<size.height {
            for c in 0..<size.width {
                let point = Point(x: c, y: r)
                let char = character(at: point)
                if var words = optimisedWordList[char] {
                    var previous: [Direction:String] = [:]
                    for w in words {
                        let length = w.characters.count
                        for direction in Direction.allDirections {
                            if let valueAtPoint = previous[direction] {
                                if valueAtPoint.hasPrefix(w) {
                                    let solution = Solution(word: w, point: point, direction: direction)
                                    solvedWordList.append(solution)
                                    words.remove(at: words.index(of: w)!)
                                    break
                                }
                            }
                            else if directionIsValid(direction: direction, position: point, length: length) {
                                let valueAtPoint = word(at: point, direction: direction, length: length)
                                previous[direction] = valueAtPoint
                                if w == valueAtPoint {
                                    let solution = Solution(word: w, point: point, direction: direction)
                                    solvedWordList.append(solution)
                                    words.remove(at: words.index(of: w)!)
                                    break
                                }
                            }
                        }
                    }
                    optimisedWordList[char] = words.count > 0 ? words : nil
                    if optimisedWordList.count == 0 {
                        finishedEarly = true
                        break
                    }
                }
                if finishedEarly {
                    break
                }
            }
            if finishedEarly {
                break
            }
        }
        self.unSolvedWordList = optimisedWordList
        self.startTime = startTime
        self.solveTime = Date()
    }
    
    private func word(startPosition: Point, length: Int, direction: Direction) -> String {
        var word: String = ""
        var position = startPosition
        for _ in 0..<length {
            let character = board[position.y][position.x]
            position = position.incrementBy(direction: direction, amount: 1)
            word += String(character)
        }
        return word
    }
    
    private func character(at point: Point) -> String {
        return board[point.y][point.x]
    }
    
    private func crunchWordList(wordList: [String]) -> [String:[String]] {
        var wordDict: [String:[String]] = [:]
        for word in wordList {
            let char = word.substring(to: 1)
            if let array = wordDict[char] {
                var array = array
                array.append(word)
                wordDict[char] = array
            }
            else {
                wordDict[char] = [word]
            }
        }
        for (key,list) in wordDict {
            let sorted = list.sorted { $1.characters.count < $0.characters.count }
            wordDict[key] = sorted
        }
        return wordDict
    }
    
    private func directionIsValid(direction: Direction, position: Point, length: Int) -> Bool {
        return position.incrementBy(direction: direction, amount: length).isValid(gridSize: size)
    }
    
    private func word(at startPoint: Point, direction: Direction, length: Int) -> String {
        var word = ""
        var point = startPoint
        for _ in 0..<length {
            let letter = character(at: point)
            point = point.incrementBy(direction: direction, amount: 1)
            word += letter
        }
        
        return word
    }
    
}
